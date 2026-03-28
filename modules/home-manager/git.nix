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
      format = "openpgp";
    };

    settings = {
      user = {
        name = name;
        email = email;
      };
      init = {
        defaultBranch = "main";
      };
    };

    lfs = {
      enable = true;
    };
  };
}
