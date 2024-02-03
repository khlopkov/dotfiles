pkgs:
with pkgs;
let helpers = import ./helpers.nix { inherit pkgs; };
in [

  # Browser
  pkgs.firefox

  # Utilities
  pkgs.unzip
  pkgs.git
  pkgs.ripgrep # For recursive search

  # Editors 
  pkgs.jetbrains.idea-community

  # Messengers
  (helpers.nixGLWrap
    pkgs.telegram-desktop) # Telegram uses OpenGL, nixGLWrap required to run on non-NixOS distros
]
