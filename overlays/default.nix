final: prev: {
  n-m3u8dl-re-bin = prev.callPackage ./n-m3u8dl-re-bin.nix { };

  # streamlink tests are currently broken on macOS due to the use of a Linux-specific socket option (SO_BINDTODEVICE).
  # We disable the tests so the package can build successfully.
  streamlink = prev.streamlink.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
  });

  # mise 2026.6.11: oci::layer test fails on macOS due to setuid/setgid bit handling differences.
  # Disable tests to unblock the build.
  # mise 2026.8.3: libz-ng-sys requires cmake at build time.
  mise = prev.mise.overrideAttrs (old: {
    doCheck = false;
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ prev.cmake ];
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
