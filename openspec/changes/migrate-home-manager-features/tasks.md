## 1. Zsh Configuration Migration

- [x] 1.1 Create `modules/home-manager/zsh.nix` based on the old config
- [x] 1.2 Copy zsh configuration including history, initContent and shellAliases
- [x] 1.3 Update `modules/home-manager/default.nix` to import `zsh.nix`

## 2. Git Configuration Migration

- [x] 2.1 Create `modules/home-manager/git.nix` based on the old config
- [x] 2.2 Configure user settings, default branch, signing format, global ignores and lfs
- [x] 2.3 Update `modules/home-manager/default.nix` to import `git.nix`

## 3. Session Variables Migration

- [x] 3.1 Migrate missing session variables from legacy `home-manager.nix` into new `default.nix` (or appropriately)

## 4. Verification

- [x] 4.1 Run `nixos-rebuild switch --flake .` or `make build-switch` to verify the configuration builds successfully
- [x] 4.2 Verify aliases (`ls`, `search`) and git configuration in the shell
