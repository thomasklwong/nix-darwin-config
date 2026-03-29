# Specification: System Modules

## Purpose
The system SHALL use a modular architecture to enforce clean boundaries between macOS constraints, core packages, and user dotfiles.

## Requirements

### Requirement: Modular Core Layout
The system SHALL separate macOS constraints and user dotfiles cleanly via distinct module directories.

#### Scenario: Using modules/darwin and modules/home-manager
- **WHEN** building the configuration
- **THEN** `modules/darwin` defines system-wide settings and `modules/home-manager` defines user-specific environments.

### Requirement: Granular Submodules
The system SHALL break down large configurations into cohesive submodules like `system-defaults.nix` and `networking.nix`.

#### Scenario: Extracting macOS Defaults
- **WHEN** macOS system defaults (e.g., Trackpad, Finder) are defined
- **THEN** they reside in `modules/darwin/system-defaults.nix` rather than a monolithic file.

### Requirement: First-class Custom Overlays
The system SHALL isolate custom and binary derivations into an `overlays/` directory which are then injected into `pkgs`.

#### Scenario: Building custom binaries
- **WHEN** a custom package like `n-m3u8dl-re-bin.nix` is required
- **THEN** it is placed in an `overlays/` directory and injected into `pkgs` via `nixpkgs.overlays`.
