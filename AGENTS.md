# AGENTS.md

Repository guidelines and architectural context for AI agents (Antigravity / Gemini) working on `nix-darwin-config`.

---

## 1. System & Architecture Overview

* **Target OS:** Apple Silicon macOS (`aarch64-darwin`). Maintain a macOS-only configuration.
* **Core Framework:** `nix-darwin` + `home-manager` + `nixpkgs` (unstable channel).
* **Package Strategy:**
  * **Homebrew (`modules/brew`):** macOS GUI Casks (`casks`), Mac App Store apps (`masApps`), and fast-updating macOS CLI binaries (`brews`).
  * **Nix (`modules/nix-packages` & `modules/home-manager`):** Declarative system settings, Zsh, Git, Home-Manager dotfiles, security tools, and specialized developer utilities.

---

## 2. Repository Layout

* [`flake.nix`](./flake.nix): Flake entry point & system output definition.
* [`Makefile`](./Makefile): Build and maintenance entry points (`make`, `make update`, `make update-packages`).
* [`modules/darwin/`](./modules/darwin): System-level defaults, networking, and Dock configuration (`dockutil`).
* [`modules/brew/`](./modules/brew): Homebrew taps, brews, casks, and Mac App Store declarations.
* [`modules/nix-packages/`](./modules/nix-packages): Nix system packages (`environment.systemPackages`).
* [`modules/home-manager/`](./modules/home-manager): User dotfiles, environment variables, PATH entries, and app configurations.
* [`overlays/`](./overlays): Custom Nix package overlays and build patches.

---

## 3. Workflow & Code Standards

* **Formatting:** Always run `nixfmt` on modified `.nix` files before finishing a change.
* **Validation:** Run `make check-all` (`nix build .#darwinConfigurations.macbook.system --dry-run`) to verify nix evaluation.
* **Password Privileges:** Commands requiring `sudo` (e.g. `darwin-rebuild switch`) must be executed directly by the user in their terminal.
