{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.local.dock;
in
{
  options = {
    local.dock.enable = mkOption {
      description = "Enable declarative dock management using dockutil";
      type = types.bool;
      default = false;
    };

    local.dock.entries = mkOption {
      description = "List of entries for the Dock (apps or folders)";
      type = with types; listOf (submodule {
        options = {
          path = mkOption { type = str; description = "Path to the application or folder"; };
          section = mkOption {
            type = str;
            default = "apps";
            description = "Dock section (apps or others)";
          };
          options = mkOption {
            type = str;
            default = "";
            description = "Additional options for dockutil";
          };
        };
      });
      default = [];
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.dockutil ];

    system.activationScripts.configureDock.text = 
      let
        normalize = path: if hasSuffix ".app" path then path + "/" else path;
        entryURI = path: "file://" + (builtins.replaceStrings
          [" "   "!"   "\""  "#"   "$"   "%"   "&"   "'"   "("   ")"]
          ["%20" "%21" "%22" "%23" "%24" "%25" "%26" "%27" "%28" "%29"]
          (normalize path)
        );
        wantURIs = concatMapStrings
          (entry: "${entryURI entry.path}\n")
          cfg.entries;
        createEntries = concatMapStrings
          (entry: "${pkgs.dockutil}/bin/dockutil --no-restart --add '${entry.path}' --section ${entry.section} ${entry.options}\n")
          cfg.entries;
      in
      ''
        echo >&2 "Configuring Dock entries..."

        # Get the currently logged-in user
        loggedInUser="$(/usr/bin/stat -f%Su /dev/console)"

        if [ -z "$loggedInUser" ] || [ "$loggedInUser" = "root" ]; then
          echo >&2 "No user logged in or running as root, skipping Dock configuration."
        else
          # Check if the desired state matches the current state
          haveURIs="$(sudo -u "$loggedInUser" ${pkgs.dockutil}/bin/dockutil --list | ${pkgs.coreutils}/bin/cut -f2)"
          
          if ! diff -wu <(echo -n "$haveURIs") <(echo -n '${wantURIs}') >&2 ; then
            echo >&2 "Synchronizing Dock icons for $loggedInUser..."
            
            # Clear all current entries first
            sudo -u "$loggedInUser" ${pkgs.dockutil}/bin/dockutil --no-restart --remove all
            
            # Add specified entries
            sudo -u "$loggedInUser" /bin/bash -c "
              ${createEntries}
            "
            
            # Restart Dock to apply changes
            /usr/bin/killall Dock
          else
            echo >&2 "Dock configuration is already up to date."
          fi
        fi
      '';
  };
}
