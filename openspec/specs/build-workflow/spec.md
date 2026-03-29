# Specification: Build Workflow

## Purpose
The system SHALL provide a simplified lifecycle for building and updating the configuration.

## Requirements

### Requirement: Makefile Driven Environment
The system SHALL encapsulate complex `nix-darwin` build commands into a `Makefile`.

#### Scenario: Updating the system
- **WHEN** the user runs `make update`
- **THEN** the Makefile triggers flake updates, system rebuilds, and any necessary runtime refreshes cleanly.
