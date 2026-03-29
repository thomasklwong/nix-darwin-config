## Why

Migrate the declarative installation of Mac App Store (mas) applications from the legacy `nixos-config` to the new modular `nix-darwin` architecture. This ensures essential macOS applications (such as Keynote, Pages, Numbers, Xcode, LINE, and 1Password for Safari) are automatically provisioned during system setup.

## What Changes

- Add a `homebrew.masApps` configuration block to the relevant `nix-darwin` homebrew module.
- Port over the list of active `masApps` from `old-config/modules/darwin/home-manager.nix`.

## Capabilities

### New Capabilities
- `mac-app-store`: Declarative installation and management of Mac App Store applications via `homebrew.masApps`.

### Modified Capabilities


## Impact

- Modifies the system's `homebrew` module.
- Requires the user to be signed into the Mac App Store to successfully provision these apps.
