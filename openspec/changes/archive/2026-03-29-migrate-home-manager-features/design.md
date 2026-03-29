## Context
The user is migrating from a previous NixOS/Darwin setup to a new, macOS-focused `nix-darwin` and `home-manager` configuration. While core modules like Ghostty, Kitty, and Neovim have been migrated, essential developer environment configurations such as shell history, custom environment variables, Git configurations (like aliases and LFS), and custom shell functions/aliases remain in the legacy configuration.

The legacy configuration files `old-config/modules/darwin/home-manager.nix` and `old-config/modules/shared/home-manager.nix` contain these settings. This proposal aims to migrate these features cleanly into the new `modules/home-manager/` structure.

## Goals / Non-Goals

**Goals:**
- Migrate `zsh` settings (history, aliases, custom `initContent` for NDK, `shell` function) from `old-config/modules/shared/home-manager.nix` into a dedicated `modules/home-manager/zsh.nix` (or integrate into an existing shell module).
- Migrate `git` settings (signing format, defaults, LFS, aliases) into a dedicated `modules/home-manager/git.nix`.
- Migrate any session variables defined in `old-config/modules/darwin/home-manager.nix` into `modules/home-manager/default.nix` or an appropriate environment settings file.
- Ensure the migrated configuration is correctly imported and active in the new `nix-darwin` setup.

**Non-Goals:**
- Refactoring the entire `home-manager` structure beyond migrating these specific features.
- Introducing new tools or features not present in the old configuration.

## Decisions
1.  **Module Creation/Updating:**
    -   We will create a `modules/home-manager/git.nix` module for Git configuration to keep it separate and modular.
    -   We will create a `modules/home-manager/zsh.nix` module for Zsh specific configurations like aliases and history, separating it from the root `default.nix`.
    -   We will review `old-config/modules/darwin/home-manager.nix` to identify any lingering environment variables or PATH additions and add them to `modules/home-manager/default.nix` under `home.sessionVariables` or `home.sessionPath`.
2.  **Importing Modules:**
    -   The newly created `git.nix` and `zsh.nix` will be added to the `imports` list in `modules/home-manager/default.nix`.

## Risks / Trade-offs
-   **Risk:** Duplication of settings if some of these configurations have already been partially migrated to other files.
    -   *Mitigation:* Review the new `nix-darwin` codebase to ensure we aren't duplicating variables or aliases.
-   **Risk:** Deprecated options in Home Manager.
    -   *Mitigation:* We will update the configurations to use current Home Manager best practices (e.g., ensuring `programs.git.signing.format` is correctly set, which we saw in a previous task).
