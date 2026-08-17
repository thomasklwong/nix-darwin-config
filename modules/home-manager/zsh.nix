{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autocd = false;

    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      size = 100000;
      save = 100000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      extended = true;
      share = true;
      ignorePatterns = [
        "pwd"
        "ls"
        "cd"
        "clear"
        "history"
        "exit"
        "fg"
        "bg"
        "top"
        "htop"
        "btop"
      ];
    };

    initContent = lib.mkBefore ''
      # 1. Enable unique constraints on PATH to auto-remove duplicates
      typeset -U path

      if [ -f "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      if [ -d "$ANDROID_HOME/ndk" ]; then
         export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 "$ANDROID_HOME/ndk" | head -n 1)"
      fi

      # nix shortcuts
      shell() {
          nix-shell '<nixpkgs>' -A "$1"
      }

      help() {
          "$@" --help 2>&1 | bathelp
      }

      eval "$(mise activate zsh)"
    '';
  };
}
