# Proposal: Migrate Declarative Dock Module

## Goal
Restore the "fully declarative" Dock management capability from the legacy configuration by porting the custom `dockutil`-based module. 

## Reason
The native `nix-darwin` `system.defaults.dock.persistent-apps` option is often insufficient for managing the exact state and order of Dock icons. Porting the legacy module ensures the Dock is consistently cleared and re-populated with the user's curated apps.

## Scope
- Port `old-config/modules/darwin/dock/default.nix` to `modules/darwin/dock.nix`.
- Clean up and modernize the activation script logic to handle `dockutil` efficiently.
- Configure the app list in `modules/darwin/default.nix`.

## Non-goals
- Configuring individual app settings (this is handled by Home Manager or system-defaults).
- Managing third-party Dock replacements.
