{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;

    # I am going to ghostty via homebrew.
    # Disable nix installing it.
    package = null;

    settings = {
      font-family = "Menlo";
      alpha-blending = "native";
      theme = "catppuccin-mocha";
      cursor-style = "bar";
      cursor-style-blink = true;
      cursor-click-to-move = true;
      mouse-hide-while-typing = true;
      background-opacity = 0.8;
      # background-blur = 20;
      background-blur = "macos-glass-regular";
      unfocused-split-opacity = 0.6;
      scrollback-limit = 1073741824;
      link-url = true;
      link-previews = true;
      window-colorspace = "display-p3";
      clipboard-read = "ask";
      clipboard-write = "ask";
      clipboard-trim-trailing-spaces = true;
      clipboard-paste-protection = true;
      clipboard-paste-bracketed-safe = true;
      copy-on-select = false;
      quit-after-last-window-closed = true;
      quick-terminal-position = "top";
      quick-terminal-size = "33%";
      shell-integration-features = [
        "cursor"
        "sudo"
        "ssh-env"
        "ssh-terminfo"
        "path"
        "title"
      ];
      macos-titlebar-style = "transparent";
      macos-option-as-alt = "left";
      macos-auto-secure-input = true;
      macos-secure-input-indication = true;
      macos-icon = "microchip";
      bold-is-bright = true;
      term = "xterm";
      auto-update = "check";
      keybind = [
        "global:cmd+backquote=toggle_quick_terminal"
      ];
    };
  };
}
