{ pkgs, ... }:

{
  programs.mise = {
    enable = true;

    # The mise binary is managed by Homebrew (modules/brew/default.nix) to use
    # pre-compiled macOS bottles and avoid building the large Rust package from source.
    # Setting package = null ensures Home Manager still generates ~/.config/mise/config.toml
    # declaratively without installing or building pkgs.mise.
    package = null;

    # Disabled here to avoid HM warnings when package = null;
    # Shell activation (`eval "$(mise activate zsh)"`) is handled in modules/home-manager/zsh.nix.
    enableZshIntegration = false;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableNushellIntegration = false;

    globalConfig = {
      hooks = {
        postinstall = "npx corepack enable";
      };
      settings = {
        color_theme = "catppuccin";
        experimental = true;
        disable_tools = [ "update_check" ];
        gpg_verify = true;
        idiomatic_version_file_enable_tools = [
          "node"
          "python"
        ];

        # Wait 7 days before install tool to avoid supply chain attack.
        install_before = "7d";

        # Config files with this prefix will be trusted by default
        trusted_config_paths = [ "~/src" ];

        node.corepack = true;

        npm.package_manager = "auto";

        python.uv_venv_auto = "create|source";
      };
      tools = {
        bun = "latest";
        deno = "latest";
        node = "latest";
        pnpm = "latest";
        "npm:@fission-ai/openspec" = "latest";
        "npm:@aisuite/chub" = "latest";
        "pypi:serena-agent" = "latest";
      };
    };
  };
}
