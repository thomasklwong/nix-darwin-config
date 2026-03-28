## ADDED Requirements

### Requirement: Zsh history configuration
The system SHALL configure Zsh to save history correctly, preserving the configuration from the legacy setup.

#### Scenario: User runs a command
- **WHEN** a user executes a command in Zsh
- **THEN** it is saved to the history file

### Requirement: NDK initialization
The system SHALL configure Zsh `initExtra` to include NDK path setup if it was in the legacy configuration.

#### Scenario: User starts Zsh
- **WHEN** a user opens a new Zsh session
- **THEN** the Android NDK path is correctly initialized

### Requirement: Shell aliases and functions
The system SHALL define shell aliases and functions (like the `shell` function) present in the old configuration.

#### Scenario: User types an alias
- **WHEN** a user types a configured alias
- **THEN** the expected expanded command runs

### Requirement: Session variables
The system SHALL export session variables necessary for the development environment.

#### Scenario: User checks environment
- **WHEN** a user echoes a session variable (e.g., `EDITOR`)
- **THEN** it returns the expected configured value
