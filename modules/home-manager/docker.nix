{ config, pkgs, ... }:
{
  # --- DOCKER HYBRID ARCHITECTURE ---
  # Why: We manage Contexts (endpoints) via Nix for reproducibility across nodes,
  # but we keep config.json MUTABLE and OUTSIDE of Nix management.
  # 
  # Reason: 'docker login' (GHCR/DockerHub) and 'docker context use' require 
  # write access to config.json. Nix-managed files are read-only symlinks.
  #
  # BOOTSTRAP COMMAND (Run once on new machines):
  # mkdir -p ~/.config/docker && cat <<EOF > ~/.config/docker/config.json
  # {
  #   "credsStore": "osxkeychain",
  #   "currentContext": "colima"
  # }
  # EOF

  home = {
    packages = [
      pkgs.docker-client
      pkgs.docker-credential-helpers
    ];
    sessionVariables = {
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    };
  };

  xdg.configFile."docker/contexts/configs/colima/meta.json".text = builtins.toJSON {
    Name = "colima";
    Metadata = {
      Description = "colima";
    };
    Endpoints.docker = {
      Host = "unix://${config.xdg.configHome}/colima/default/docker.sock";
      SkipTLSVerify = false;
    };
  };
}
