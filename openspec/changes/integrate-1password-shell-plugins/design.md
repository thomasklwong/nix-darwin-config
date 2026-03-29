## Context
Current `nix-darwin` configuration manages system settings and Home Manager modules.
The user wants to use 1Password for shell plugin authentication, which requires adding a third-party flake and configuring its Home Manager module.

## Goals / Non-Goals
**Goals:**
- Seamlessly integrate `_1password-shell-plugins` into the existing Flake structure.
- Enable automatic CLI authentication for `gh`, `awscli2`, and other tools via 1Password.
- Maintain a modular Nix configuration by creating a dedicated module for 1Password settings.

**Non-Goals:**
- Configuring non-shell 1Password integrations (e.g., SSH agent).
- Migrating existing non-1Password authentication for these tools immediately (this will coexist or replace).

## Decisions
1. **Flake Input**: Add `_1password-shell-plugins` to `flake.nix`.
2. **Module Integration**:
    - Add `inputs._1password-shell-plugins.hmModules.default` to the Home Manager imports in `modules/home-manager/default.nix`.
    - Create `modules/home-manager/1password.nix` for the configuration.
3. **Plugin Configuration**: Enable `gh` and `awscli2` as initial plugins.

## Risks / Trade-offs
- **Flake Dependency**: Adds another flake input, increasing the size of `flake.lock`.
- **Desktop Agent Requirement**: Shell plugins require the 1Password desktop app to be running.
