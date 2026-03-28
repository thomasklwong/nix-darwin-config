## ADDED Requirements

### Requirement: Modular Core Layout

The system SHALL separate macOS constraints and user dotfiles cleanly.

#### Scenario: Using modules/darwin and modules/home-manager

- **WHEN** building the configuration
- **THEN** `modules/darwin` defines system-wide settings and `modules/home-manager` defines user-specific environments.

### Requirement: Granular Submodules

The system SHALL break down large legacy configuration files into cohesive submodules.

#### Scenario: Extracting macOS Defaults

- **WHEN** macOS system defaults are defined
- **THEN** they are located in a distinct `modules/darwin/system-defaults.nix` file rather than a monolithic host file.

### Requirement: XDG Compliant Home Manager Configs

The system SHALL store static configuration files for Home Manager in a dedicated `config` folder.

#### Scenario: Declaring static configs

- **WHEN** a static file like `1Password_ssh_agent.toml` is needed
- **THEN** it resides in `modules/home-manager/config/` and is sympathetically linked.
