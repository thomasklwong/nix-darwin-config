## 1. Nix Configuration

- [x] 1.1 Update `modules/home-manager/git.nix` to use `ssh` format
- [x] 1.2 Point `programs.git.signing.signer` and `programs.git.extraConfig.gpg.ssh.program` to 1Password
- [x] 1.3 Add placeholders for user name, email, and signing key or use variables

## 2. Verification

- [x] 2.1 Run `nixfmt` to check syntax
- [x] 2.2 Verify `darwin-rebuild build` passes (dry-run)
