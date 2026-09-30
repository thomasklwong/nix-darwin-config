final: prev: {
  n-m3u8dl-re-bin = prev.callPackage ./n-m3u8dl-re-bin.nix { };

  # streamlink tests are currently broken on macOS due to the use of a Linux-specific socket option (SO_BINDTODEVICE).
  # We disable the tests so the package can build successfully.
  streamlink = prev.streamlink.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
  });

  # shaka-packager builds with -Werror, but abseil-cpp deprecates Base64Escape(..., &out).
  # We treat deprecated declarations as warnings to unblock compilation.
  shaka-packager = prev.shaka-packager.overrideAttrs (old: {
    env = (old.env or { }) // {
      NIX_CFLAGS_COMPILE =
        toString (old.env.NIX_CFLAGS_COMPILE or "") + " -Wno-error=deprecated-declarations";
    };
  });

  pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [
    (python-final: python-prev: {
      mitmproxy = python-prev.mitmproxy.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          substituteInPlace pyproject.toml \
            --replace-warn 'msgpack>=1.0.0,<=1.1.2' 'msgpack>=1.0.0' \
            --replace-warn 'msgpack<=1.1.2' 'msgpack<=1.2.1'
        '';
      });
    })
  ];
}
