{ config, lib, ... }:

{
  homebrew = {
    enable = true;
    
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "homebrew/cask-versions"
      "homebrew/services"
    ];

    brews = [
      "mise" # Node manager
      "gh"
      "yt-dlp"
    ];

    casks = [
      "1password"
      "google-chrome"
      "visual-studio-code"
      "orbstack"
      "raycast"
    ];
  };
}
