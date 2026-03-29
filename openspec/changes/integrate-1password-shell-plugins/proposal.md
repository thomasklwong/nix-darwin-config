# Proposal: Integrate _1password-shell-plugins

## Context
The user wants to integrate 1Password Shell Plugins into their `nix-darwin` configuration to allow secure CLI authentication through 1Password for various tools.

## Objective
- Add `_1password-shell-plugins` as a flake input.
- Import and enable the `_1password-shell-plugins` Home Manager module in the `thomas` user configuration.
- Configure initial plugins (e.g., `gh`, `awscli2`) to test the integration.

## What Changes
- `flake.nix`: Add `_1password-shell-plugins` to `inputs` and pass it to modules.
- `modules/home-manager/default.nix`: Import the 1Password module.
- New file `modules/home-manager/1password.nix`: Define `programs._1password-shell-plugins` configuration.

## Capabilities

### New Capabilities
- `1password-shell-plugins`: Integration of 1Password shell plugins for CLI authentication.

### Modified Capabilities
- none

## Impact
- `home-manager` configurations will now depend on the `_1password-shell-plugins` flake.
- Shell (Zsh) will be augmented with 1Password aliases for configured plugins.
