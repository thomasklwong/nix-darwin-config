# Specification: Flake Foundation

## Purpose
The system SHALL use Nix Flakes as the primary mechanism for dependency management and configuration evaluation.

## Requirements

### Requirement: Flake Initialization
The system SHALL use a `flake.nix` file as the primary entrypoint for the `nix-darwin` configuration.

#### Scenario: Instantiating darwinConfigurations
- **WHEN** the system evaluates `flake.nix` (`nix flake show`)
- **THEN** it outputs a `darwinConfigurations` attribute containing the macOS host definitions.

### Requirement: Auto-updating Nix daemon
The system SHALL configure the Nix daemon to update itself automatically in line with the latest nixpkg version.

#### Scenario: Verify Nix daemon setting
- **WHEN** configuration is applied
- **THEN** `services.nix-daemon.enable` is true and `nix.package` is configured to track official releases.
