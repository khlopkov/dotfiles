{ pkgs, ... }:
let helpers = import ../helpers.nix { inherit pkgs; };
in {
  home.packages = with pkgs; [
    # Browser
    firefox-bin

    # Utilities
    unzip

    # Editors
    jetbrains.idea-community

    # Messengers
    (helpers.nixGLWrap
      telegram-desktop) # Telegram uses OpenGL, nixGLWrap required to run on non-NixOS distros
  ];
}
