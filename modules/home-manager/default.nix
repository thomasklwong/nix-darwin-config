{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  home.stateVersion = "24.11";

  # Map declarative configs from our config/ directory
  home.file.".config/1Password/ssh/agent.toml".source = ./config/1Password_ssh_agent.toml;
  home.file.".config/ghostty/config".source = ./config/ghostty_config;
  home.file.".config/mise/config.toml".source = ./config/mise_config.toml;
  home.file.".ssh/config".source = ./config/ssh_config;
  home.file."Library/Application Support/Rectangle/RectangleConfig.json".source = ./config/RectangleConfig.json;

  home.sessionVariables = {
    JAVA_HOME = "/Applications/Android Studio.app/Contents/jbr/Contents/Home";
    ANDROID_HOME = "${config.home.homeDirectory}/Library/Android/sdk";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.local/share/bin"
    "/opt/homebrew/bin"
    "${config.home.sessionVariables.ANDROID_HOME}/emulator"
    "${config.home.sessionVariables.ANDROID_HOME}/platform-tools"
    "${config.home.sessionVariables.ANDROID_HOME}/cmdline-tools/latest/bin"
    "/Applications/Antigravity.app/Contents/Resources/app/bin"
  ];
}
