## 1. Homebrew Migration

- [x] 1.1 Migrate Brews from `old-config/modules/darwin/brews.nix` to `modules/brew/default.nix`
- [x] 1.2 Migrate Casks from `old-config/modules/darwin/casks.nix` to `modules/brew/default.nix`
- [x] 1.3 Deduplicate and verify Brew configuration

## 2. Nix Package Migration

- [x] 2.1 Merge shared Nix packages from `old-config/modules/shared/packages.nix` into `modules/nix-packages/default.nix`
- [x] 2.2 Merge Darwin-specific Nix packages from `old-config/modules/darwin/packages.nix` into `modules/nix-packages/default.nix`
- [x] 2.3 Verify Nix evaluation and package availability
