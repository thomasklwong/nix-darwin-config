{ pkgs, ... }:
{
  # Custom module for docker-cli and bypass programs.docker-cli

  home = {
    packages = [ pkgs.docker-client ];
    sessionVariables = {
      DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    };
  };

  xdg.configFile."docker/contexts/configs/colima/meta.json".text = builtins.toJSON {
    Name = "colima";
    Metadata = { Description = "colima"; };
    Endpoints.docker = {
      Host = "unix:///Users/thomas/.colima/default/docker.sock";
      SkipTLSVerify = false;
    };
  };
}
