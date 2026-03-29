## Context

The current repository follows a modular flake structure for `nix-darwin`. However, many package definitions remain in a legacy `old-config/` directory. This design documents the migration of these definitions into the modern `modules/` system.

## Goals / Non-Goals

**Goals:**
- Consolidate all packages from `old-config/` into `modules/brew` and `modules/nix-packages`.
- Deduplicate packages that appear in both legacy and modern configurations (e.g., `1password`, `gh`).
- Maintain existing installation methods (e.g., keep Homebrew packages in Homebrew, Nix packages in Nix).

**Non-Goals:**
- Changing the package manager for specific tools (e.g., moving a Brew package to Nix).
- Adding new, unrelated packages.

## Decisions

- **Package Source Priority**: If a package exists in the new target `modules/` already, I will preserve its definition there and skip it from the migration list to avoid duplicates.
- **Mise Placement**: `mise` is currently in Homebrew in the new config but was in Nix in the old config. I will keep it in Homebrew to respect the target's current state.
- **Nix Package Formatting**: All Nix packages will be unified into a single `with pkgs; [ ... ]` list in `modules/nix-packages/default.nix`.
- **Custom Packages**: We will maintain the dynamic reference `pkgs."n-m3u8dl-re-bin"` in the target file.

## Risks / Trade-offs

- **Metadata Sync**: Homebrew casks might have slightly different names or versions in the new environment; however, using common identifiers should minimize this risk.
- **Volume of Changes**: Migrating ~150 packages at once is a large change, but straightforward as it mostly involves list updates.
