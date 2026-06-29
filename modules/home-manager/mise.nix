{ pkgs, ... }:

{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      hooks = {
        postinstall = "npx corepack enable";
      };
      settings = {
        color_theme = "catppuccin";
        experimental = true;
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

        npm.package_manager = "pnpm";

        python.uv_venv_auto = "create|source";
      };
      tools = {
        bun = "latest";
        deno = "latest";
        node = "latest";
        pnpm = "latest";
        "npm:@google/gemini-cli" = "latest";
        "npm:@fission-ai/openspec" = "latest";
        "npm:@aisuite/chub" = "latest";
      };
    };
  };
}
