{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  # Map declarative configs from our config/ directory
  home.file.".config/1Password/ssh/agent.toml".source = ./config/1Password_ssh_agent.toml;
  home.file.".config/ghostty/config".source = ./config/ghostty_config;
  home.file.".config/mise/config.toml".source = ./config/mise_config.toml;
  home.file.".ssh/config".source = ./config/ssh_config;
  home.file."Library/Application Support/Rectangle/RectangleConfig.json".source = ./config/RectangleConfig.json;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
}
