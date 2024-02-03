pkgs:
with pkgs;
let helpers = import ./helpers.nix { inherit pkgs; };
in [

  # Browser
  firefox

  # Utilities
  unzip

  # Editors 
  jetbrains.idea-community

  # Messengers
  (helpers.nixGLWrap
    telegram-desktop) # Telegram uses OpenGL, nixGLWrap required to run on non-NixOS distros
]
