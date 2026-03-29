## 1. Port Dock Module

- [x] 1.1 Create `modules/darwin/dock.nix`.
- [x] 1.2 Define `local.dock.enable` and `local.dock.entries` options.
- [x] 1.3 Port the `configureDock` activation script from legacy config.
- [x] 1.4 Ensure `dockutil` is included in the activation script environment.

## 2. Integrate and Configure

- [x] 2.1 Import `./dock.nix` in `modules/darwin/default.nix`.
- [x] 2.2 Restore the application list in `modules/darwin/default.nix` under `local.dock.entries`.

## 3. Build and Verify

- [ ] 3.1 Execute `darwin-rebuild switch` to apply the new Dock configuration.
- [ ] 3.2 Verify the Dock is cleared and re-populated in the correct order.
