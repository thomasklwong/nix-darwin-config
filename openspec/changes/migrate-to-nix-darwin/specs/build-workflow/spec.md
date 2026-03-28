## ADDED Requirements

### Requirement: Makefile Driven Environment
The system SHALL encapsulate complex nix-darwin build commands into a `Makefile`.

#### Scenario: Updating the system
- **WHEN** the user runs `make update`
- **THEN** the Makefile triggers flake updates, system rebuilds, and any necessary runtime refreshes cleanly.
