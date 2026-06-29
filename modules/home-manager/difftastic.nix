{ pkgs, ... }:
{
  programs.difftastic = {
    enable = true;
    git = {
      enable = true;
      mode = "difftool";
    };
    jujutsu.enable = true;
  };
}
