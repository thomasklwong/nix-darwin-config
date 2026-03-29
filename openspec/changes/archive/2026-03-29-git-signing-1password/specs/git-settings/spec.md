## MODIFIED Requirements

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
