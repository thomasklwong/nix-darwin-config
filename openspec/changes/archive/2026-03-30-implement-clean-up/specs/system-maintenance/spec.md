## ADDED Requirements

### Requirement: Unified Cleanup Interface
The Makefile must provide a top-level `cleanup` command that performs maintenance tasks for all configured package managers.

#### Scenario: Running full cleanup
- **WHEN** user runs `make cleanup`
- **THEN** `cleanup-nix`, `cleanup-brew`, and `cleanup-mise` are executed in sequence.

### Requirement: Nix Store Maintenance
Individual targets for Nix store garbage collection and build artifact removal must be provided.

#### Scenario: Cleaning nix artifacts
- **WHEN** user runs `make cleanup-nix`
- **THEN** the `./result` symlink is removed.
- **AND** `nix store gc` is executed.
- **AND** `nix-collect-garbage -d` is executed to remove old generations.

### Requirement: Brew Maintenance
A target for Homebrew cache and old version cleanup must be provided.

#### Scenario: Cleaning brew artifacts
- **WHEN** user runs `make cleanup-brew`
- **THEN** `brew cleanup` is executed.
