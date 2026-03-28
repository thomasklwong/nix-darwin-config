## ADDED Requirements

### Requirement: Migrate Brews
The system should include all brews previously defined in the legacy configuration.

#### Scenario: Deduplicate Existing Brews
- **WHEN** a brew (e.g., `gh`) is already present in `modules/brew/default.nix`
- **THEN** it should not be duplicated when migrating from `old-config/modules/darwin/brews.nix`

### Requirement: Migrate Casks
The system should include all casks previously defined in the legacy configuration.

#### Scenario: Deduplicate Existing Casks
- **WHEN** a cask (e.g., `1password`) is already present in `modules/brew/default.nix`
- **THEN** it should not be duplicated when migrating from `old-config/modules/darwin/casks.nix`
