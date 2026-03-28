{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core tools
    git
    vim
    curl
    wget
    ripgrep
    jq
    
    # Custom packages mapped from overlays
    pkgs."n-m3u8dl-re-bin"
  ];
}
