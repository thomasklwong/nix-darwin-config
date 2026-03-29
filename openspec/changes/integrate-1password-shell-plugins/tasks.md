## 1. Configuration Setup

- [x] 1.1 Add `_1password-shell-plugins` to `flake.nix` inputs.
- [x] 1.2 Run `nix flake lock` to update dependencies.

## 2. Home Manager Implementation

- [x] 2.1 Import `_1password-shell-plugins.hmModules.default` in `modules/home-manager/default.nix`.
- [x] 2.2 Create `modules/home-manager/1password.nix` with plugin configuration.
- [x] 2.3 Import `1password.nix` in `modules/home-manager/default.nix`.

## 3. Verification

- [x] 3.1 Run `make build` to check syntax.
- [x] 3.2 Verify aliases in a new Zsh session.
