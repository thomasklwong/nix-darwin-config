## Context

The legacy `nixos-config` contained a list of Mac App Store (mas) applications configured through `home-manager.nix`, relying on system-level `homebrew` to install them via the `mas` CLI. For the new modular `nix-darwin` flake architecture, we need to ensure these applications are correctly provisioned by the `homebrew` module.

## Goals / Non-Goals

**Goals:**
- Port the existing `masApps` configuration from the legacy setup to the new `nix-darwin` flake.
- Ensure all previously used Mac App Store apps (Keynote, Pages, Numbers, Xcode, LINE, HP Smart, 1Password for Safari) are declaratively managed.

**Non-Goals:**
- Creating a script to auto-login to the Mac App Store (this is a manual user step).
- Modifying standard Homebrew formulas or casks.

## Decisions

- **Configuration Location**: We will place the `masApps` configuration directly inside the `homebrew.nix` module within `modules/darwin` (or the corresponding Homebrew module in the new structure). This keeps all Homebrew-related settings—including taps, brews, casks, and masApps—unified under one module.
- **Handling of Commented Apps**: Apps that were commented out in the old config (like iMovie, GarageBand, GoPro Player, Wireless@SGx) will be omitted or remain commented out to preserve the exact active state from the legacy system.

## Risks / Trade-offs

- **Risk**: The installation of Mac App Store apps via Nix and the `mas` CLI will silently fail or hang if the user is not authenticated with the Mac App Store on their device.
  - **Mitigation**: Add a clear comment in the `homebrew.nix` file reminding the user that they must sign into the App Store manually before running the `nix-darwin` installation.
