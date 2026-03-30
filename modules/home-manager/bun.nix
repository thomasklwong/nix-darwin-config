{ pkgs, ... }:
{
  programs.bun = {
    enable = true;

    # I am going to bun via mise
    # Disable nix installing it and complained about git integration.
    package = null;
    enableGitIntegration = false;

    settings = {
      smol = true;
      telemetry = false;
    };
  };
}
