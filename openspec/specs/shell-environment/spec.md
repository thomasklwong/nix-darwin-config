# Specification: Shell Environment

## Purpose
The system SHALL provide a feature-rich Zsh environment with history, aliases, and development tool integration.

## Requirements

### Requirement: Configure Zsh History
The Zsh history SHOULD be configured for high capacity (100,000 lines) and optimized saving (ignore dups, share history).

#### Scenario: Verify Zsh History Size
- **WHEN** user checks Zsh history configuration
- **THEN** it should have a capacity to store 100,000 lines.

### Requirement: Custom shell aliases
The system SHALL define shell aliases for common tools like `ls`, `search` (rg), and `diff` (difft).

#### Scenario: Verify ls Alias
- **WHEN** user types `ls`
- **THEN** it should execute `ls --color=auto`.

### Requirement: Native Mise Integration
The system SHALL initialize `mise` for dynamic runtime management in every Zsh session.

#### Scenario: Verify Mise activation
- **WHEN** opening a new Zsh session
- **THEN** `eval "$(mise activate zsh)"` is executed.

### Requirement: NDK Initialization
The system SHALL initialize `NDK_HOME` if `$ANDROID_HOME/ndk` is present.

#### Scenario: Evaluate NDK_HOME
- **WHEN** opening a shell
- **THEN** if `$ANDROID_HOME/ndk` is present, `NDK_HOME` is set.

### Requirement: Unique Path Constraints
Zsh SHOULD be configured to auto-remove duplicate entries from the `PATH`.

#### Scenario: Verify path uniqueness
- **WHEN** adding a duplicate entry to `PATH`
- **THEN** Zsh automatically deduplicates it via `typeset -U path`.
