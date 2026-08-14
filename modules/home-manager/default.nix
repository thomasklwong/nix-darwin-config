{
  config,
  pkgs,
  lib,
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
    ./docker.nix
    ./git.nix
    ./ghostty.nix
    ./mise.nix
    ./zsh.nix
  ];

  xdg.enable = true;
  programs.dircolors.enable = true;

  home.stateVersion = "24.11";

  # Map declarative configs from our config/ directory
  home.file.".config/1Password/ssh/agent.toml".source = ./config/1Password_ssh_agent.toml;
  home.file.".ssh/config".source = ./config/ssh_config;

  home.activation = {
    copyRectangleConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      target="$HOME/Library/Application Support/Rectangle/RectangleConfig.json"
      if [ -L "$target" ]; then
        $DRY_RUN_CMD rm -f "$target"
      fi
      $DRY_RUN_CMD mkdir -p "$HOME/Library/Application Support/Rectangle"
      $DRY_RUN_CMD cp -f ${./config/RectangleConfig.json} "$target"
      $DRY_RUN_CMD chmod 600 "$target"
    '';
  };

  home.sessionVariables = {
    JAVA_HOME = "/Applications/Android Studio.app/Contents/jbr/Contents/Home";
    ANDROID_HOME = "${config.home.homeDirectory}/Library/Android/sdk";
    EDITOR = "agy";
    MANPAGER = "bat -plman";
    TIZEN_HOME = "${config.home.homeDirectory}/tizen-studio";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.sessionVariables.ANDROID_HOME}/emulator"
    "${config.home.sessionVariables.ANDROID_HOME}/platform-tools"
    "${config.home.sessionVariables.ANDROID_HOME}/cmdline-tools/latest/bin"
    "${config.home.sessionVariables.TIZEN_HOME}/tools"
    "${config.home.sessionVariables.TIZEN_HOME}/tools/ide/bin"
    "${config.home.sessionVariables.TIZEN_HOME}/library"
    "${config.home.sessionVariables.TIZEN_HOME}/tools/device-manager/bin/device-manager.app/Contents/MacOS"
    "${config.home.sessionVariables.TIZEN_HOME}/tools/tizen-core"
    "${config.home.sessionVariables.TIZEN_HOME}/package-manager/package-manager.app/Contents/MacOS"
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
