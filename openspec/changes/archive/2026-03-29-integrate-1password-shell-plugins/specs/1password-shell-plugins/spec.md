## ADDED Requirements

### Requirement: 1Password Shell Plugins are integrated
The system SHALL have `_1password-shell-plugins` enabled in Home Manager.

#### Scenario: Verify plugin aliases in shell
- **WHEN** user runs `alias gh` in Zsh
- **THEN** the output should indicate authentication through 1Password (e.g., `op plugin run -- gh`).

### Requirement: Flake Integration
The `flake.nix` SHALL include `_1password-shell-plugins` in the inputs.

#### Scenario: Check flake lock
- **WHEN** user runs `nix flake metadata`
- **THEN** `_1password-shell-plugins` should appear in the input list.
