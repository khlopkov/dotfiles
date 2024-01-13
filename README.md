# Home Manager configuration for my system

## Dependencies

This home-manager has been set up over Debian distro instead of NixOS, therefore it has system level dependencies:

- [Nix package manager](https://nixos.org/download#download-nix).
- X11 server.
- Network Manager. Network Manager writes to `/etc/network/` directory.
- Graphic Card drivers. 
  Config uses a [nixGL wrapper](https://github.com/nix-community/nixGL) allowing installation of OpenGL for non-NixOS environments.
  Helpers wrapping packages are declared in [helpers file](./helpers.nix)
