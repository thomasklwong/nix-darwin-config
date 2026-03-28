# Spec: Shell Environment

## ADDED Requirements

### Requirement: Configure Zsh History
The zsh history should be configured for a high capacity and smart saving.

#### Scenario: Verify Zsh History Size
- **WHEN** user types history
- **THEN** it should have a capacity to store 100000 lines.

### Requirement: Custom shell aliases
The system should define handy aliases like `ls`, `search`, `diff`, `agy`.

#### Scenario: Verify ls Alias
- **WHEN** user type `ls`
- **THEN** the alias for `ls --color=auto` should be invoked.

### Requirement: Initialize Nix daemon
The shell initialization should load the Nix daemon if available.

#### Scenario: Nix initialization
- **WHEN** opening a new shell
- **THEN** the `nix-daemon.sh` and `nix.sh` are sourced.

### Requirement: Session Variables
Global session variables like email, name, or NDK_HOME.

#### Scenario: Evaluate NDK_HOME
- **WHEN** opening a shell
- **THEN** if `$ANDROID_HOME/ndk` is present, `NDK_HOME` is set.
