# Specification: Nix Packages

## Purpose
The system SHALL manage cross-platform and development tools through official Nix packages to ensure reproducibility and version control.

## Requirements

### Requirement: Dedicated Nix Packages Module
The system SHALL group all Nix packages into a dedicated capability module located in `modules/nix-packages` or `modules/darwin/packages.nix`.

#### Scenario: Verify package availability
- **WHEN** user types `nix profile list` or checks `/run/current-system/sw/bin`
- **THEN** Nix-maintained tools (e.g., `nixfmt`, `ripgrep`, `jq`) should be present.

### Requirement: Global System Packages
The system SHALL configure `environment.systemPackages` at the darwin level for tools required by the root user or system scripts.

#### Scenario: Check system-wide tools
- **WHEN** user lists the packages in the system profile
- **THEN** tools like `git` and `zsh` appear to be managed at the system level.
