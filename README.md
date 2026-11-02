# Home Manager configuration for my system

## Dependencies

This home-manager has been set up over Debian distro instead of NixOS, therefore it has system level dependencies:

- [Nix package manager](https://nixos.org/download#download-nix).
- X11 server.
- Network Manager. Network Manager writes to `/etc/network/` directory.
- Graphic Card drivers. 
  Config uses a [nixGL wrapper](https://github.com/nix-community/nixGL) allowing installation of OpenGL for non-NixOS environments.
  Helpers wrapping packages are declared in [helpers file](./helpers.nix)

## Local configuration

Machine-specific values (username, home directory, system, desktop) live in an untracked `local/config.nix`.
It is plugged into the flake as the `local-config` input via `--override-input`; `local.example/` is a reference to copy from.

```sh
cp -r local.example local   # then edit local/config.nix
task dry-run                # tasks pass --override-input local-config path:./local
```
