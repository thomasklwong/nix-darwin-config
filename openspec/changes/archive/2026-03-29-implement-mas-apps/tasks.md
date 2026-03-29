## 1. Setup

- [x] 1.1 Locate the active `homebrew` configuration module in the `modules/darwin/` directory.

## 2. Configuration

- [x] 2.1 Add the `masApps` attribute block to the `homebrew` configuration.
- [x] 2.2 Port over the active applications: Keynote, Pages, Numbers, Disk Speed Test, Xcode, LINE, HP Smart, 1Password for Safari.
- [x] 2.3 Port over the commented out applications to preserve history (iMovie, GarageBand, GoPro Player, Wireless@SGx).
- [x] 2.4 Add a comment block inside the `masApps` block reminding the user to login to the Mac App Store before running the configuration.

## 3. Verification

- [x] 3.1 Run the `nix-darwin` build-switch command to apply the updated configuration and ensure there are no Nix evaluation errors.
