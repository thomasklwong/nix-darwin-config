#!/usr/bin/env bash
set -euo pipefail

REPO="cshariq/Sapphire"
APP_NAME="Sapphire.app"
DEST_DIR="/Applications"
TARGET_APP="${DEST_DIR}/${APP_NAME}"

echo "==> Checking for Sapphire.app updates..."

# Fetch latest release data from GitHub
RELEASE_JSON=""
if command -v gh >/dev/null 2>&1; then
  RELEASE_JSON=$(gh release view -R "$REPO" --json tagName,assets 2>/dev/null || true)
fi

if [ -z "$RELEASE_JSON" ]; then
  RELEASE_JSON=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" 2>/dev/null || true)
fi

if [ -z "$RELEASE_JSON" ]; then
  echo "Warning: Could not fetch latest release info for ${REPO}. Skipping Sapphire.app update."
  exit 0
fi

# Extract tag name / version
TAG_NAME=$(echo "$RELEASE_JSON" | jq -r '.tagName // .tag_name // empty')
if [ -z "$TAG_NAME" ]; then
  echo "Warning: Could not parse tag name for ${REPO}. Skipping."
  exit 0
fi

LATEST_VERSION="${TAG_NAME#v}"

# Check currently installed version
CURRENT_VERSION=""
if [ -d "$TARGET_APP" ]; then
  CURRENT_VERSION=$(defaults read "${TARGET_APP}/Contents/Info" CFBundleShortVersionString 2>/dev/null || true)
fi

if [ -n "$CURRENT_VERSION" ] && [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
  echo "Sapphire.app is up to date (${CURRENT_VERSION})."
  exit 0
fi

if [ -n "$CURRENT_VERSION" ]; then
  echo "Upgrading Sapphire.app: ${CURRENT_VERSION} -> ${LATEST_VERSION}..."
else
  echo "Installing Sapphire.app (${LATEST_VERSION})..."
fi

DOWNLOAD_URL=$(echo "$RELEASE_JSON" | jq -r '
  (.assets // []) as $assets |
  ($assets[] | select(.name | test("(?i)sapphire.*\\.zip$")) | (.browser_download_url // .url)) //
  ($assets[] | select(.name | test(".*\\.zip$")) | (.browser_download_url // .url)) //
  empty
' | head -n 1)

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Error: No matching ZIP asset found in release ${TAG_NAME}."
  exit 1
fi

TMP_DIR=$(mktemp -d -t sapphire_update_XXXXXX)
EXTRACT_DIR="${TMP_DIR}/extract"
ZIP_FILE="${TMP_DIR}/sapphire.zip"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT INT TERM

echo "Downloading $(basename "$DOWNLOAD_URL")..."
curl -fL --progress-bar -o "$ZIP_FILE" "$DOWNLOAD_URL"

mkdir -p "$EXTRACT_DIR"
echo "Extracting archive..."
unzip -q -o "$ZIP_FILE" -d "$EXTRACT_DIR"

SRC_APP=$(find "$EXTRACT_DIR" -maxdepth 2 -name "${APP_NAME}" | head -n 1)
if [ -z "$SRC_APP" ] || [ ! -d "$SRC_APP" ]; then
  echo "Error: Could not find ${APP_NAME} in downloaded archive."
  exit 1
fi

echo "Installing ${APP_NAME} to ${DEST_DIR}..."
rm -rf "$TARGET_APP"
ditto "$SRC_APP" "$TARGET_APP"

# Strip quarantine attribute to prevent Gatekeeper blockage
xattr -cr "$TARGET_APP" 2>/dev/null || true

echo "==> Sapphire.app successfully installed (${LATEST_VERSION})."
