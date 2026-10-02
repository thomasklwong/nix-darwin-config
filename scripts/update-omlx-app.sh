#!/usr/bin/env bash
set -euo pipefail

REPO="jundot/omlx"
APP_NAME="oMLX.app"
DEST_DIR="/Applications"
TARGET_APP="${DEST_DIR}/${APP_NAME}"

echo "==> Checking for oMLX.app updates..."

# Detect running macOS major version
MACOS_MAJOR=$(sw_vers -productVersion | cut -d. -f1)

# Fetch latest release data from GitHub
RELEASE_JSON=""
if command -v gh >/dev/null 2>&1; then
  RELEASE_JSON=$(gh release view -R "$REPO" --json tagName,assets 2>/dev/null || true)
fi

if [ -z "$RELEASE_JSON" ]; then
  RELEASE_JSON=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest" 2>/dev/null || true)
fi

if [ -z "$RELEASE_JSON" ]; then
  echo "Warning: Could not fetch latest release info for ${REPO}. Skipping oMLX.app update."
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
  echo "oMLX.app is up to date (${CURRENT_VERSION})."
  exit 0
fi

if [ -n "$CURRENT_VERSION" ]; then
  echo "Upgrading oMLX.app: ${CURRENT_VERSION} -> ${LATEST_VERSION}..."
else
  echo "Installing oMLX.app (${LATEST_VERSION})..."
fi

# Select appropriate DMG based on macOS version:
# macOS 26+: macos26-27.dmg
# macOS 15: macos15-sequoia.dmg
PATTERN="macos26"
if [ "$MACOS_MAJOR" -lt 26 ]; then
  PATTERN="macos15"
fi

DOWNLOAD_URL=$(echo "$RELEASE_JSON" | jq -r --arg pat "$PATTERN" '
  (.assets // []) as $assets |
  ($assets[] | select(.name | test($pat + ".*\\.dmg$")) | (.browser_download_url // .url)) //
  ($assets[] | select(.name | test("\\.dmg$")) | (.browser_download_url // .url)) //
  empty
' | head -n 1)

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Error: No matching DMG asset found for macOS ${MACOS_MAJOR} in release ${TAG_NAME}."
  exit 1
fi

TMP_DIR=$(mktemp -d -t omlx_update_XXXXXX)
MOUNT_DIR="${TMP_DIR}/mount"
DMG_FILE="${TMP_DIR}/omlx.dmg"

cleanup() {
  if [ -d "$MOUNT_DIR" ]; then
    hdiutil detach "$MOUNT_DIR" -force -quiet 2>/dev/null || true
  fi
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT INT TERM

echo "Downloading $(basename "$DOWNLOAD_URL")..."
curl -fL --progress-bar -o "$DMG_FILE" "$DOWNLOAD_URL"

mkdir -p "$MOUNT_DIR"
echo "Mounting disk image..."
hdiutil attach -nobrowse -readonly "$DMG_FILE" -mountpoint "$MOUNT_DIR" -quiet

SRC_APP=$(find "$MOUNT_DIR" -maxdepth 2 -name "${APP_NAME}" | head -n 1)
if [ -z "$SRC_APP" ] || [ ! -d "$SRC_APP" ]; then
  echo "Error: Could not find ${APP_NAME} in downloaded disk image."
  exit 1
fi

echo "Installing ${APP_NAME} to ${DEST_DIR}..."
# Use ditto to preserve resource forks, extended attributes, and code signatures
ditto "$SRC_APP" "$TARGET_APP"

# Strip quarantine attribute to prevent Gatekeeper blockage
xattr -cr "$TARGET_APP" 2>/dev/null || true

echo "==> oMLX.app successfully installed (${LATEST_VERSION})."
