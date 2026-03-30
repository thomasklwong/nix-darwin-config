## Why

Maintainability and system performance decrease over time as build artifacts (`result` symlinks), unused nix store paths, outdated brew caches, and unused mise runtimes accumulate. Consolidating these maintenance tasks into the `Makefile` provides a unified, easy-to-use interface for system housekeeping.

## What Changes

The `Makefile` will be refactored to include:
- Maintenance targets for individual package managers (`cleanup-nix`, `cleanup-brew`, `cleanup-mise`).
- A consolidated `cleanup` target that runs all of them.
- A `update-mise` target for upgrading development runtimes.
- Renaming the generic `update` target to `update-nix` for clarity.
- Updating `update-all` to perform a full system update followed by a cleanup.

## Capabilities

### New Capabilities
- `system-maintenance`: Provide a unified interface for cleaning up build artifacts and package manager caches.

### Modified Capabilities
- `makefile-targets`: Refactor existing Makefile targets to improve consistency and include maintenance task orchestration.

## Impact

The `Makefile` will have a richer set of targets. Users will be able to run `make cleanup` to free up space. No changes to the underlying Nix configuration or machine state beyond standard maintenance operations.
