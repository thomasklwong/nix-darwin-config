## Context

The current `nixos-config` is a multi-platform configuration repository inherited from a legacy fork that handles both NixOS and macOS. Managing this creates high mental overhead. We are isolating and extracting the macOS-specific components to build a pristine, macOS-exclusive `nix-darwin` configuration from scratch. The old configuration remains as a submodule reference (`old-config/`) to ensure no user settings are lost during the transition.

## Goals / Non-Goals

**Goals:**
- Provide a `flake.nix` entrypoint containing the `darwinConfigurations`.
- Completely decouple system components (`modules/darwin`) from user components (`modules/home-manager`).
- Integrate a hybrid package model (Nix + Homebrew + Mise).
- Abstract `nix-darwin` execution logic behind a declarative `Makefile`.

**Non-Goals:**
- Support for NixOS or Linux platforms.
- Complete 1:1 migration of obsolete or unused packages from the legacy repository.
- Migrating `mise` controlled Node environments back into pure Nix derivations. 

## Decisions

**1. Modular Structure via High Cohesion**
- **Decision:** Establish strong directory boundaries: `modules/darwin/`, `modules/home-manager/`, and `modules/brew/`. Monolithic files like the legacy `hosts/darwin/default.nix` and system defaults will be fragmented into distinct files (e.g., `modules/darwin/system-defaults.nix`, `networking.nix`, etc.).
- **Rationale:** Massively increases readability, allows AI agents and humans to understand the config at a glance, and prevents "god file" anti-patterns.

**2. Homebrew File Co-location**
- **Decision:** brews and casks will both be defined within a single `modules/brew/default.nix`.
- **Rationale:** Since Nix-Darwin groups them under the exact same root option (`homebrew`), separating them purely by format creates unnecessary module fragmentation. 

**3. Nix Overlays Directory**
- **Decision:** Custom built derivations that are not up-streamed in Nixpkgs (like `n-m3u8dl-re-bin`) will be housed inside an `overlays/` folder.
- **Rationale:** This is the community-accepted standard for patching and injecting custom package maps into the global `pkgs` parameter, keeping the system configuration modules clean.

**4. Home Manager XDG Semantics**
- **Decision:** Static dotfiles linked via `home.file` will be stored in `modules/home-manager/config/`.
- **Rationale:** Using `config/` rather than `files/` maps symmetrically to the `.config/` XDG standard where most of these dotfiles inevitably end up residing on the system.

**5. Makefile Orchestration**
- **Decision:** A `Makefile` will be used to execute all system mutations (build, update, switch).
- **Rationale:** Flake syntax and Darwin switch commands are extremely verbose (`nix build .#darwinConfigurations.macbook.system`, etc.). A simple `make update` acts as a facade, ensuring correct evaluation without memorizing Nix CLI flags.

## Risks / Trade-offs

- **Risk: Silent Omission of Legacy Settings** → **Mitigation:** The `old-config` will remain available as a git submodule during the migration so that the `tasks.md` phase can systematically audit every line of `old-config/hosts/darwin/default.nix` against the new submodules.
- **Risk: State Collision during Transition** → **Mitigation:** The new `flake.nix` will force the user to adopt the initial evaluation cleanly. The `Makefile` will include failsafes and rollback parameters.
- **Trade-off: Hybrid Package Management Complexity** → **Mitigation:** By explicitly mapping why a package lives in Nix vs Homebrew vs Mise, we endure slight fragmentation for significantly better version stability (Casks/Mise usually stay more updated for UI/WebDev than Nix).
