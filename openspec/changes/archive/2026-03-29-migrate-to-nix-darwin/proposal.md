## Why

The goal is to move away from a multi-platform nixos implementation toward a macOS-only environment. By maintaining a macOS-only `nix-darwin` environment, we aim to minimize mental overhead and create a cleaner, minimalist configuration tailored specifically for macOS, unifying logic previously split between shared and darwin modules.

## What Changes

- **Flake-based Setup**: Initialize a new Nix flake that orchestrates the `darwinConfigurations`. This configuration will explicitly ensure that Nix itself, and the nix-daemon, are automatically updated (`services.nix-daemon.enable = true` and `nix.package = pkgs.nix`).
- **Modular Directory Structure**: Restructure configurations into dedicated modules (`modules/darwin`, `modules/home-manager`, and `modules/brew`), making it sensible and easy to extend.
- **Hybrid Package Strategy**: Utilize Homebrew (for Cask/GUI and version-critical CLI tools), Nix (for general tools like ffmpeg), and `mise` for node environments in case we need npm-based tools. 
  - *Note on Homebrew & Cask*: Both brews and casks will be managed in a single `modules/brew/default.nix` file. Since they both fall under the `homebrew.*` configuration namespace, keeping them in one file is minimalist and sufficient. They can always be split later if the lists grow substantially.
  - *Note on Nix Packages*: We will explicitly define a module (`modules/darwin/packages.nix` or similar) dedicated to globally installed Nix packages.
- **Makefile Integration**: Introduce a `Makefile` to simplify and abstract the system build and refresh steps (`make update`) rather than invoking Nix switch commands directly.
- **Node Management via Mise**: Explicitly hook `mise` into the environment for seamless node management.

### Architectural Mandates
- **Overlays**: We will maintain a dedicated `overlays/` folder. Custom derivations (like `n-m3u8dl-re-bin`) will be housed here and injected cleanly into the package set, rather than floating inside configuration modules.
- **Home Manager Semantics**: Static dotfiles and application configurations managed by Home Manager will be organized in a `modules/home-manager/config/` directory (rather than a generic `files/` directory) to better align with the XDG Base Directory specification.
- **Submodule Breakdown**: We will rigorously analyze the monolithic files from `old-config` (especially the massive macOS `system` block in `hosts/darwin/default.nix`) and break them apart into highly cohesive, logically separated submodules (e.g., `modules/darwin/system-defaults.nix`). This ensures the new implementation is readable and easily navigable for both humans and AI agents.

## Capabilities

### New Capabilities
- `flake-foundation`: Sets up the core `flake.nix` and instantiates the base system configuration and `darwinConfigurations`.
- `system-modules`: Defines `modules/darwin` and `modules/home-manager` logic, encapsulating user settings and macOS defaults without legacy nix-os overhead.
- `package-strategy`: Configures `modules/brew` (managing both brews and casks in a single file) and `modules/nix-packages` (for explicitly defining Nix-managed global dependencies), along with `mise` to manage Node.js versions.
- `build-workflow`: Introduces a `Makefile` orchestrating system updates, builds, and development runtime refreshes.

### Modified Capabilities
<!-- No existing capabilities to modify. -->

## Impact

This constitutes a clean-room rewrite that will completely replace existing system configurations. The old `nixos-config` reference structure will be abandoned in favor of the new modular layouts. Users transitioning to this will apply the new Flake and the accompanying Home Manager logic exclusively on macOS platforms.
