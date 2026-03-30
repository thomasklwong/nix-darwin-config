## 1. Makefile Refactoring

- [ ] 1.1 Rename `update` target to `update-nix`.
- [ ] 1.2 Add `update-mise` target for mise upgrade logic.
- [ ] 1.3 Add `cleanup-nix` target for nix garbage collection and result removal.
- [ ] 1.4 Add `cleanup-brew` target for brew cleanup logic.
- [ ] 1.5 Add `cleanup-mise` target for mise pruning logic.
- [ ] 1.6 Add consolidated `cleanup` target that depends on all cleanup- targets.
- [ ] 1.7 Update `update-all` target to include update-nix, update-mise, and cleanup.

## 2. Verification

- [ ] 2.1 Run `make fmt` to ensure valid Makefile syntax.
- [ ] 2.2 Verify `make cleanup` runs all maintenance tasks.
- [ ] 2.3 Verify `make update-all` flows through the new targets correctly.
