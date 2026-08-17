{
  config,
  pkgs,
  inputs,
  ...
}:

let
  user = "thomas";
in
{
  imports = [
    ./system-defaults.nix
    ./networking.nix
    ./dock.nix
  ];

  ids.gids.nixbld = 350;

  users.users."${user}" = {
    name = user;
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  system = {
    primaryUser = user;
    stateVersion = 6;
    checks.verifyNixPath = false;
  };

  nix = {
    enable = true;
    package = pkgs.nixVersions.latest;
    settings = {
      trusted-users = [
        "@admin"
        "${user}"
      ];
      download-buffer-size = 5368709120;
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
  };

  programs.zsh.enable = true;
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];
  environment.shells = [
    pkgs.bashInteractive
    pkgs.zsh
  ];

  # Declarative Dock configuration
  local.dock = {
    enable = true;
    entries = [
      { path = "/Applications/LINE.app/"; }
      { path = "/Applications/Signal.app/"; }
      { path = "/Applications/Firefox.app/"; }
      { path = "/Applications/Firefox Developer Edition.app/"; }
      { path = "/Applications/Google Chrome.app/"; }
      { path = "/Applications/Google Chrome Canary.app/"; }
      { path = "/Applications/Safari.app/"; }
      { path = "/Applications/1Password.app/"; }
      { path = "/Applications/Fork.app/"; }
      { path = "/Applications/Obsidian.app/"; }
      { path = "/Applications/Visual Studio Code.app/"; }
      { path = "/Applications/Ghostty.app/"; }
      {
        path = "/Users/${user}/Downloads";
        section = "others";
        options = "--sort name --view grid --display stack";
      }
    ];
  };
}
