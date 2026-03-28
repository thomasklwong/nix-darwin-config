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
      "cairo"
      "cocoapods"
      "colima"
      "colmsg"
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
      "pango"
      "pixman"
      "pkg-config"
      "python-setuptools"
      "ramalama"
      "ruby-build"
      "teamookla/speedtest/speedtest"
      "tsduck"
      "you-get"

      "mise"
      "yt-dlp"
    ];

    casks = [
      "1password"
      #"adobe-digital-editions"
      "android-studio"
      "appcleaner"
      "block-goose"
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
      "lm-studio"
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
      "tailscale-app"
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
      "zenmap"
    ];
  };
}
