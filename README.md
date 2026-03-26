# `nix-darwin-config`

Personal macOS configuration using `nix-darwin` and Home Manager.

# Philosophy

This is a Clean Room reimplementation of my legacy configuration. The goal is to move away from a multi-platform implementation toward a macOS only environment.

* macOS Only, emove all NixOS logic to minimise my mental overhead.
* Hybrid package strategy
  * Homebrew: Cask will be used for all GUI applications. Brew will be used for CLI tools where version recency is critical to me.
  * Mise: Previously, some tools like Gemini CLI or OpenSpec was only available on npm. Though nowaday they are available on brew, but I want to keep mise configuration open in case a new tool is only release on npm initially.
  * nix: Other tools, like ffmpeg, will continue to be sourced from nix.
* 1Password as Secret Manager.
* Managed via `Makefile`.

## Structure

Structure

* `modules/darwin`: System-level settings and macOS defaults (Dock, Keyboard, etc.).
* `modules/home-manager`: User-level dotfiles and Zsh/shell configuration.
* `modules/brew`: Declarative management of Taps, Brews, and Casks.
* `old-config/`: (Submodule) Historical reference of the original Mitchellh fork.

## Run

To pull latest updates, build the system, and refresh development runtimes:

```sh
make update
```

## Attribution & History

This configuration is a clean-room rewrite and evolution of my [previous setup](https://github.com/thomasklwong/old-nixos-config), which was originally forked from [mitchellh/nixos-config](https://github.com/mitchellh/nixos-config/tree/c6e0576355f1941ab87cbe591488248b1760df72) at commit `c6e0576`. 

While the architecture has been simplified to a macOS-exclusive `nix-darwin` implementation, I am grateful for the original implementation patterns that informed this modular design.

## License

MIT
