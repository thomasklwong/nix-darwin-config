# Specification: Brew Packages

## Purpose
The system SHALL manage macOS-specific applications and fast-moving CLI tools natively using Homebrew within nix-darwin.

## Requirements

### Requirement: Unified Brew Configuration
The system SHALL manage all brews and casks in a central `modules/brew/default.nix` file.

#### Scenario: Declaring brews and casks
- **WHEN** adding `gh`, `1password`, or `firefox`
- **THEN** they are added to the `homebrew.brews` or `homebrew.casks` list in its respective module.

### Requirement: Migration from Legacy Configurations
The system SHOULD migrate existing brews and casks from legacy `old-config` files (`brews.nix`, `casks.nix`) without duplication.

#### Scenario: Deduplicate Existing Brews
- **WHEN** a brew is already in `modules/brew/default.nix`
- **THEN** it should NOT be duplicated if found in the legacy files.
