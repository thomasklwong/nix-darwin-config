{ config, pkgs, ... }:

let
  name = "Thomas Wong";
  email = "1935201+thomasklwong@users.noreply.github.com";
in
{
  programs.git = {
    enable = true;
    ignores = [
      "*.swp"
      ".DS_Store"
    ];

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE6JGbDRE20NKwRJO+p1x2qc//UrdaVfj9Gn2Pn2RVpJ";
      format = "ssh";
      signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };

    settings = {
      user = {
        inherit name email;
      };
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgsign = true;
      };
      gpg = {
        format = "ssh";
        ssh = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
      };
    };

    lfs = {
      enable = true;
    };
  };
}
