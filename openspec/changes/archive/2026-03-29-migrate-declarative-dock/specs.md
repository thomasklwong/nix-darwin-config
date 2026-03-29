# Specs: Migrate Declarative Dock Module

## ADDED Requirements

### Requirement: Declarative Dock Management
The system SHALL provide a way to manage the macOS Dock icons and folders via Nix.

#### Scenario: Syncing Dock Entries
- **WHEN** the `local.dock.entries` list is modified
- **THEN** the system SHALL synchronize the Dock icons to match the specified list and order.

### Requirement: Dock Cleanup
The system SHALL ensure that the Dock does not contain any unintended icons.

#### Scenario: Clearing Existing Icons
- **WHEN** the `configureDock` activation script detects a change in the Dock configuration
- **THEN** it SHALL clear the existing Dock entries before populating them with the new configuration.

### Requirement: Safe Activation
The system SHALL only attempt to configure the Dock when a user is logged in.

#### Scenario: No user logged in
- **WHEN** `darwin-rebuild switch` is executed during a time when no user is logged in (e.g., at login window or via SSH)
- **THEN** the `configureDock` script SHALL exit gracefully without attempting to modify the Dock.
