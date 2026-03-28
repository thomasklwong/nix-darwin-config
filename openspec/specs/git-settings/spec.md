# Spec: Git Settings

## ADDED Requirements

### Requirement: Configure Global Git Identity
Git should be globally configured with the user's name and email.

#### Scenario: Check Global Name and Email
- **WHEN** user types `git config --global user.name`
- **THEN** it outputs "Thomas Wong"
- **WHEN** user types `git config --global user.email`
- **THEN** it outputs "1935201+thomasklwong@users.noreply.github.com"

### Requirement: Configure Git Signing
Git should be configured for signing commits using `openpgp`.

#### Scenario: Check Signing Format
- **WHEN** evaluating `programs.git.signing.format`
- **THEN** it returns `"openpgp"`.

### Requirement: Git Global Ignores
Git should globally ignore specific patterns like `*.swp`.

#### Scenario: Verify Global Ignore
- **WHEN** user commits a file named `test.swp`
- **THEN** the file is ignored by git.

### Requirement: Default Branch
Git initialization should set `main` as the default branch.

#### Scenario: Verify Default Branch
- **WHEN** typing `git init` in a new directory
- **THEN** the default branch is `main`.

### Requirement: Enable Git LFS
Git LFS should be enabled globally.

#### Scenario: Verify Git LFS Enabled
- **WHEN** evaluating `programs.git.lfs.enable`
- **THEN** it evaluates to true.
