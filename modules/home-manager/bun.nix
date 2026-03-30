{ pkgs, ... }:
{
  programs.bun = {
    enable = true;

    # I am going to bun via mise
    # Disable nix installing it.
    package = null;

    settings = {
      smol = true;
      telemetry = false;
    };
  };
}
