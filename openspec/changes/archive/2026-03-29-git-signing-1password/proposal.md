## Why

Enabling git signing via 1Password provides a more secure and seamless signing experience on macOS. It leverages the secure enclave and biometric authentication of 1Password, removing the need to manage separate GPG keys.

## What Changes

- Change global git signing format from `openpgp` to `ssh`.
- Configure git to use 1Password's SSH agent for signing.
- Update `user.signingKey` to the SSH public key from 1Password.
- Configure `gpg.ssh.program` to point to 1Password's signing tool on macOS.

## Capabilities

### New Capabilities

- None

### Modified Capabilities

- `git-settings`: Change signing requirement from `openpgp` to `ssh` via 1Password.

## Impact

- `modules/home-manager/git.nix` will be modified.
- User will need to ensure 1Password SSH agent is enabled and provides the correct public key.
