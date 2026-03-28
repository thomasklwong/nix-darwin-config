# Design: Migrate Declarative Dock Module

## Context
The legacy configuration utilized a custom Nix module located at `old-config/modules/darwin/dock/default.nix`. This module used `dockutil` to provide a fully declarative way to manage Dock entries (apps and folders). The current `nix-darwin` configuration is missing this capability.

## Goals / Non-Goals

**Goals:**
- Provide a `local.dock.entries` option to specify Dock icons programmatically.
- Ensure the Dock state is exactly as specified by clearing existing entries first.
- Support both "apps" and "others" (folders/files) sections.

**Non-Goals:**
- Handling multiple user profiles with different Docks (targeting the primary user `thomas`).
- Integration with third-party launchers like Raycast or Alfred.

## Decisions

### 1. Unified Darwin Module
The module will be ported to `modules/darwin/dock.nix` and imported in the main `modules/darwin/default.nix`. This aligns with our modularity goal from the Refactor Protocol.

### 2. Dockutil Synchronization
We will continue using `dockutil` inside a `system.activationScripts` block. This approach is more reliable than standard `defaults write` commands because it updates the underlying `com.apple.dock.plist` and triggers the necessary Dock restarts.

### 3. Activation Script Safety
The activation script will check for a logged-on user via `logname` and use `sudo -u` to execute `dockutil` commands. This ensures that the configuration is applied correctly when the system is switched.

## Risks / Trade-offs

- **Risk**: `dockutil` might not be installed or available during activation. 
- **Mitigation**: We will ensure `dockutil` is explicitly added to the activation script's environment or `systemPackages`.
- **Trade-off**: Clearing the Dock on every switch might be disruptive if the build is frequent. 
- **Mitigation**: We will implement a basic `diff` check (as seen in the legacy code) to skip the reset if the current Dock matches the intended state.
