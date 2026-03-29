## ADDED Requirements

### Requirement: Global Git configuration
The system SHALL configure Git with the user's global settings from the legacy configuration.

#### Scenario: User checks git config
- **WHEN** a user runs `git config --global --list`
- **THEN** it shows the configured name, email, and signing settings

### Requirement: Global Git ignores
The system SHALL set up global Git ignore patterns.

#### Scenario: User creates an ignored file
- **WHEN** a user creates a file matching a global ignore pattern (like `.DS_Store`)
- **THEN** Git does not track it by default

### Requirement: Git LFS configuration
The system SHALL enable Git LFS support.

#### Scenario: User works with large files
- **WHEN** a user checks out an LFS-enabled repository
- **THEN** Git LFS functions correctly and fetches large files
