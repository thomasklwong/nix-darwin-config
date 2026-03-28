## ADDED Requirements

### Requirement: Unified Brew Configuration
The system SHALL configure Homebrew brews and casks natively inside nix-darwin.

#### Scenario: Declaring brews and casks
- **WHEN** defining macOS applications and fast-moving CLIs
- **THEN** both are managed together in a single `modules/brew/default.nix` file.

### Requirement: Dedicated Nix Packages Module
The system SHALL cleanly segregate Nix-managed packages into their own capability module.

#### Scenario: Importing global packages
- **WHEN** system-wide Nix tools are required
- **THEN** they are defined in `modules/nix-packages` (or `modules/darwin/packages.nix`).

### Requirement: First-class Custom Overlays
The system SHALL isolate custom derivations from the main configuration stream.

#### Scenario: Building custom binaries
- **WHEN** a custom package like `n-m3u8dl-re-bin.nix` is required
- **THEN** it is placed in an `overlays/` directory and injected into `pkgs`.

### Requirement: Node Management via Mise
The system SHALL natively install and configure `mise`.

#### Scenario: Setting up node support
- **WHEN** npm/node tools are needed
- **THEN** `mise` acts as the standard runtime manager instead of Nix directly provisioning node tools.
