final: prev: {
  n-m3u8dl-re-bin = prev.callPackage ./n-m3u8dl-re-bin.nix { };

  # streamlink tests are currently broken on macOS due to the use of a Linux-specific socket option (SO_BINDTODEVICE).
  # We disable the tests so the package can build successfully.
  streamlink = prev.streamlink.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
  });
}
