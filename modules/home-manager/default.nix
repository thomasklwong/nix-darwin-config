{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs._1password-shell-plugins.hmModules.default
    ./1password.nix
    ./bat.nix
    ./bun.nix
    ./difftastic.nix
    ./git.nix
    ./ghostty.nix
    ./mise.nix
    ./zsh.nix
  ];

  xdg.enable = true;
  dircolors.enable = true;

  home.stateVersion = "24.11";

  # Map declarative configs from our config/ directory
  home.file.".config/1Password/ssh/agent.toml".source = ./config/1Password_ssh_agent.toml;
  home.file.".ssh/config".source = ./config/ssh_config;
  home.file."Library/Application Support/Rectangle/RectangleConfig.json".source =
    ./config/RectangleConfig.json;

  home.sessionVariables = {
    JAVA_HOME = "/Applications/Android Studio.app/Contents/jbr/Contents/Home";
    ANDROID_HOME = "${config.home.homeDirectory}/Library/Android/sdk";
    EDITOR = "agy";
    MANPAGER = "bat -plman";
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

  home.shell.enableZshIntegration = true;

  home.shellAliases = {
    bathelp = "bat --plain --language=help";
    cat = "bat";
    ls = "ls --color=auto";
    search = "rg -p --glob '!node_modules/*' ";
    diff = "difft";
    agy = "/Applications/Antigravity.app/Contents/Resources/app/bin/antigravity";
  };
}
