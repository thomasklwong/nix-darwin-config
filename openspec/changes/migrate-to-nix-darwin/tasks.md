## 1. Setup Repository Base

- [x] 1.1 Initialize `flake.nix` importing `nix-darwin` and `home-manager` to output `darwinConfigurations`.
- [x] 1.2 Create the top-level directory structure (`modules/darwin`, `modules/home-manager`, `modules/brew`, `overlays`).
- [x] 1.3 Create `Makefile` with an `update` command mapping to the correct nix build/switch execution.

## 2. Darwin System Layout

- [x] 2.1 Relocate monolithic macOS UI/Trackpad/Finder configurations from `old-config` into `modules/darwin/system-defaults.nix`.
- [x] 2.2 Relocate the firewall and networking configurations into `modules/darwin/networking.nix`.
- [x] 2.3 Configure system-level user configurations and tie the submodules together in `modules/darwin/default.nix`.
- [x] 2.4 Enable `services.nix-daemon.enable` and `nix.package` ensuring Nix daemon auto-updates.

## 3. Package Management

- [x] 3.1 Migrate `n-m3u8dl-re-bin.nix` to `overlays/` and inject the overlay into the flake's `pkgs`.
- [x] 3.2 Add `modules/nix-packages/default.nix` mapping static global nix dependencies.
- [x] 3.3 Consolidate all Homebrew taps, brews, and casks into `modules/brew/default.nix`.
- [x] 3.4 Wire `mise` installation instructions (either via Brew or Nix depending on availability) natively to manage node environments.

## 4. Home Manager Constraints

- [x] 4.1 Scaffold `modules/home-manager/default.nix` as the user entrypoint configuring `zsh`.
- [x] 4.2 Initialize the `modules/home-manager/config/` folder.
- [x] 4.3 Setup XDG declarative symlinks via `home.file` for `1Password_ssh_agent.toml` and similar dotfiles.

## 5. Build and Verify

- [x] 5.1 Execute a dry build evaluation (`nix flake show` or `nix build ... --dry-run`).
- [x] 5.2 Resolve any evaluation warnings regarding legacy syntax.
- [ ] 5.3 Attempt a state switch and verify that the system successfully replicates the old config's macOS environment.
