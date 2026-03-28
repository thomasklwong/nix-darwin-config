---
trigger: always_on
---

# Nix Refactor Protocol

## Objectives

- Main a macOS-only environment to minimize mental overhead.
- Ensure all logic that used to be split between shared/darwin modules are unified.

## Rules

- Use `nixfmt` to confirm the syntax is correct.
- If attempt to run nix/make command and the output require password. Stop immmediately and ask user to execute it for you instead.