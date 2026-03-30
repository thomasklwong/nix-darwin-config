## Context

The current `Makefile` lacks dedicated cleanup and maintenance commands, and there's an inconsistency in naming where a generic `update` target performs nix-specific tasks. As the system evolves, build outputs and package manager caches accumulate, requiring manual intervention.

## Goals / Non-Goals

**Goals:**
- Provide a clear, namespaced structure for maintenance tasks (`cleanup-nix`, `cleanup-brew`, `cleanup-mise`).
- Fix existing target naming to be more descriptive (`update` -> `update-nix`).
- Enable a single-command periodic maintenance flow via `make cleanup`.

**Non-Goals:**
- Automating system-level reboots or non-runtime updates.
- Modifying underlying Nix configuration files beyond adding Makefile orchestration.

## Decisions

### 1. Unified Cleanup Target
**Decision:** Create a `cleanup` target that depends on and executes `cleanup-nix`, `cleanup-brew`, and `cleanup-mise`.
**Rationale:** Composite targets follow the existing pattern in the Makefile (like `update-all`) and promote regular maintenance by reducing friction.

### 2. Explicit Maintenance Commands
**Decision:** 
- `cleanup-nix`: Includes `nix store gc` and `nix-collect-garbage -d`. 
- `cleanup-brew`: Includes `brew cleanup`.
- `cleanup-mise`: Includes `mise prune`.
- `update-mise`: Separated from cleanup to handle version logic separately (`mise upgrade`).
**Rationale:** Each tool has its own specific maintenance logic. Wrapping them in the Makefile hides the complexity of command flags while providing granular control if needed.

### 3. Naming Consistency
**Decision:** Rename `update` to `update-nix`.
**Rationale:** Avoid confusion between top-level orchestration (`update-all`) and tool-specific build/switch operations. This clarifies that the command is specifically targeting the Nix/Darwin configuration.

## Risks / Trade-offs

- **[Risk]** `nix-collect-garbage -d` deletes old generations, meaning users cannot rollback to previous system states after running it.
- **[Mitigation]** This is standard practice in a maintenance task. Users should only run `cleanup` when they are confident in their current configuration.
