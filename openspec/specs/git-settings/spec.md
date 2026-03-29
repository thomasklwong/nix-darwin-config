# Specification: Git Settings

## Purpose
The system SHALL configure Git with global identity, signing, and exclusion rules.
## Requirements
### Requirement: Configure Global Git Identity
Git SHALL be globally configured with the user's name and email.

#### Scenario: Check Global Name and Email
- **WHEN** user types `git config --global user.name`
- **THEN** it outputs "Thomas Wong"
- **WHEN** user types `git config --global user.email`
- **THEN** it outputs "1935201+thomasklwong@users.noreply.github.com"

### Requirement: Configure Git Signing
Git SHALL be configured for signing commits using `ssh` via 1Password.

#### Scenario: Check Signing Format
- **WHEN** evaluating `programs.git.signing.format`
- **THEN** it returns `"ssh"`.

#### Scenario: Check SSH Signer
- **WHEN** evaluating `programs.git.signing.signer` or `programs.git.extraConfig.gpg.ssh.program`
- **THEN** it returns `"/Applications/1Password.app/Contents/MacOS/op-ssh-sign"`.

#### Scenario: Verify GPG Signing Enabled
- **WHEN** user types `git config --global commit.gpgsign`
- **THEN** it returns "true".

### Requirement: Git Global Ignores
Git SHALL globally ignore specific patterns like `*.swp` and `.DS_Store`.

#### Scenario: Verify Global Ignore
- **WHEN** user commits a file named `test.swp`
- **THEN** the file is ignored by git.

### Requirement: Default Branch
Git initialization SHALL set `main` as the default branch.

#### Scenario: Verify Default Branch
- **WHEN** typing `git init` in a new directory
- **THEN** the default branch is `main`.

### Requirement: Enable Git LFS
Git LFS SHALL be enabled globally.

#### Scenario: Verify Git LFS Enabled
- **WHEN** evaluating `programs.git.lfs.enable`
- **THEN** it evaluates to true.

