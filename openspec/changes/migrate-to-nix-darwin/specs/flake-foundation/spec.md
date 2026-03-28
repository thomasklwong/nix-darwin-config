## ADDED Requirements

### Requirement: Flake Initialization
The system SHALL use a `flake.nix` file as the primary entrypoint for the `nix-darwin` configuration.

#### Scenario: Instantiating darwinConfigurations
- **WHEN** the system evaluates `flake.nix`
- **THEN** it outputs a `darwinConfigurations` attribute containing the macOS host definitions.

### Requirement: Auto-updating Nix
The system SHALL configure the Nix daemon to update itself automatically.

#### Scenario: Enabling nix-daemon
- **WHEN** the configuration is applied
- **THEN** `services.nix-daemon.enable` is set to true and `nix.package` is explicitly set to `pkgs.nix`.
