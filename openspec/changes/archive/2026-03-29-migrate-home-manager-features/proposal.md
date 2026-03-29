# Proposal: Migrate Home Manager Features

## The Problem
Several features from the legacy `old-config/modules/darwin/home-manager.nix` and `old-config/modules/shared/home-manager.nix` have not yet been ported to the new modularized configuration. These include essential developer environment configurations such as session variables, PATH manipulation, shell history, Git setup, and specific application aliases. This missing configuration degrades the user's development workflow.

## The Goal
To comprehensively migrate the remaining home-manager configurations from the legacy setup to the new `nix-darwin` architecture. Ensure the `zsh` environment (history, aliases, functions), `git` configuration, and other useful features from the old configuration are restored and properly structured.

## What Changes
We will extract features from the old configuration files and integrate them into the new structure under `modules/home-manager/`. Specifically:
- `zsh` configuration (history settings, `initContent` for NDK, `shell` function, aliases)
- `git` configuration (including `ignores` and LFS setup)
- Session variables

## Capabilities

### New Capabilities
- `shell-environment`: Shell environment settings, history, and aliases
- `git-settings`: Global Git configuration

### Modified Capabilities

## Impact
- **Developer Environment**: Will immediately improve the shell experience, providing familiar tools and configuration.
- **Codebase**: Adding modules to `modules/home-manager/` and ensuring they are loaded.
