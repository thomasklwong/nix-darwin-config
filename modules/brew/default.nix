{ config, lib, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "none";
      upgrade = true;
    };

    taps = [
      {
        name = "arthur-ficial/tap";
        trusted = true;
      }
      {
        name = "entireio/tap";
        trusted = true;
      }
      {
        name = "hashicorp/tap";
        trusted = true;
      }
      {
        name = "hmans/beans";
        trusted = true;
      }
      {
        name = "proshunsuke/colmsg";
        trusted = true;
      }
      {
        name = "steipete/tap";
        trusted = true;
      }
      {
        name = "teamookla/speedtest";
        trusted = true;
      }
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
        force_auto_update = true;
        trusted = true;
      }
    ];

    brews = [
      "apfel"
      "cairo"
      "cocoapods"
      "colima"
      "colmsg"
      "container"
      "czkawka"
      "gallery-dl"
      "giflib"
      "gnu-sed"
      "go"
      "hashicorp/tap/terraform"
      "instaloader"
      "jadx"
      "jpeg"
      "libpng"
      "librsvg"
      "mas"
      "mole"
      "mtr"
      # "omlx"
      "pango"
      "pixman"
      "pkg-config"
      "python-setuptools"
      "ramalama"
      "ruby-build"
      "teamookla/speedtest/speedtest"
      "tsduck"
      "you-get"
      "yt-dlp"
    ];

    casks = [
      "1password"
      #"adobe-digital-editions"
      "android-studio"
      "antigravity"
      "antigravity-cli"
      "antigravity-ide"
      "appcleaner"
      "bruno"
      "caffeine"
      "calibre"
      "charles"
      "coconutbattery"
      "codexbar"
      "disk-drill"
      "entire"
      "firefox"
      "firefox@developer-edition"
      "fork"
      "ghostty"
      "google-chrome"
      "google-chrome@canary"
      "google-drive"
      "handbrake-app"
      "hiddenbar"
      "hmans/beans/beans"
      "http-toolkit"
      "iina"
      "keka"
      "kindle-previewer"
      "logi-options+"
      "macs-fan-control"
      "mitmproxy"
      "nordvpn"
      "notion"
      "notion-calendar"
      "notunes"
      "obsidian"
      "porting-kit"
      "postman"
      "raspberry-pi-imager"
      "rectangle"
      "signal"
      "spotify"
      "tailscale-app" # This also expose tailscale CLI as /usr/local/bin/tailscale
      "teamviewer"
      "telegram"
      "temurin@21"
      "the-unarchiver"
      "utm"
      "visual-studio-code"
      "vlc"
      "vysor"
      "wireshark-app"
      "xquartz"
      "yam-display"
      "zen"
      "zenmap"
    ];

    masApps = {
      # Logged into the Mac App Store before running the nix-darwin rebuild.
      # "iMovie" = 408981434;
      "Keynote" = 409183694;
      # "Pages" = 409201541;
      # "Numbers" = 409203825;
      "Disk Speed Test" = 425264550;
      "Xcode" = 497799835;
      "LINE" = 539883307;
      # "GarageBand" = 682658836;
      # "GoPro Player" = 1460836908;
      "HP Smart" = 1474276998;
      "1Password for Safari" = 1569813296;
      # "Wireless@SGx" = 1449928544;
    };
  };
}
