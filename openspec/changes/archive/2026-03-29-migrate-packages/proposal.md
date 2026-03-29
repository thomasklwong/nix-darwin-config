## Why

Currently, package definitions are scattered across several legacy files in `old-config/`. This makes it difficult to manage and track system dependencies in the new modular structure. Unifying these into the dedicated `modules/brew/default.nix` and `modules/nix-packages/default.nix` files will improve maintainability and clarity.

## What Changes

I will migrate all package names mentioned in:
- `old-config/modules/darwin/brews.nix`
- `old-config/modules/darwin/casks.nix`
- `old-config/modules/darwin/packages.nix`
- `old-config/modules/shared/packages.nix`

Into:
- `modules/brew/default.nix` (for Brews and Casks)
- `modules/nix-packages/default.nix` (for Nix system packages)

I'll also deduplicate items already present in the target files.

## Capabilities

### New Capabilities
- `brew-packages`: Consolidated list of Homebrew brews and casks for the macOS environment.
- `nix-packages`: Consolidated list of Nix-managed system packages across shared and Darwin contexts.

### Modified Capabilities
- (None)

## Impact

- **Affected Files**: `modules/brew/default.nix`, `modules/nix-packages/default.nix`.
- **Dependencies**: Depends on the existing flake structure and Homebrew integration.
