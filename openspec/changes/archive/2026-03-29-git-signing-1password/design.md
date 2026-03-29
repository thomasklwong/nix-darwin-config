## Context

The user currently uses `openpgp` for git signing. They want to switch to 1Password's SSH signing feature, which is more convenient on macOS.

## Goals / Non-Goals

**Goals:**
- Configure Git to use 1Password for commit signing.
- Use the SSH format for signing.
- Point to the correct 1Password signing program path on macOS.

**Non-Goals:**
- Configuring 1Password itself (assumed to be installed and Git signing enabled in its settings).
- Managing multiple signing keys.

## Decisions

- **Use `programs.git.signing`**: Standard Home Manager option for git signing.
- **Set `format = "ssh"`**: Required for 1Password signing.
- **Set `signer` to `/Applications/1Password.app/Contents/MacOS/op-ssh-sign`**: The standard location for 1Password's signing helper on macOS.
- **Add `commit.gpgsign = true` to `extraConfig`**: Ensure all commits are signed.

## Risks / Trade-offs

- **[Risk] Missing SSH Public Key** → **Mitigation**: Ask user for their 1Password SSH public key to set in `user.signingKey`.
- **[Risk] 1Password not configured** → **Mitigation**: Document that the user must enable "Sign with 1Password" in 1Password settings.
