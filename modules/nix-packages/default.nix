{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core & System
    git
    vim
    curlFull
    wget
    ripgrep
    jq
    coreutils
    killall
    tree
    watch
    xz
    zip
    fzf
    fd
    bat
    htop
    btop
    cloc
    rsync

    # Development Tools
    _1password-cli
    age
    sops
    gnupg
    google-cloud-sdk
    awscli2
    devenv
    mise
    mkcert
    nixfmt
    python3
    uv
    sqlite
    imagemagickBig
    # Downgraded from `ffmpeg-full` to `ffmpeg` to prevent OOM build failures from niche dependencies (like `kvazaar`).
    # If a specific obscure codec is required for work, consider using `ffmpeg.override` instead of `ffmpeg-full`.
    ffmpeg
    pandoc
    texliveSmall
    # wkhtmltopdf # Not supported on aarch64-darwin

    # Security & Scanning
    syft
    license-scanner
    askalono
    licensee
    cyclonedx-cli
    sbom-utility
    nmap

    # Container & Orchestration
    docker
    docker-compose
    podman
    kubectl
    kind

    # Media & Network
    bento4
    shaka-packager
    streamlink
    inetutils
    iftop
    mitmproxy2swagger

    # Specialized Tools
    apktool
    aspell
    aspellDicts.en
    cabextract
    difftastic
    llama-cpp
    lz4
    nss_latest
    qemu
    fclones
    python313Packages.curl-cffi

    # Darwin Specific
    dockutil
    cocoapods

    # Custom packages mapped from overlays
    pkgs."n-m3u8dl-re-bin"
  ];
}
