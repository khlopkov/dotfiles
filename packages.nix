pkgs: with pkgs; 
  let dwm = pkgs.dwm.overrideAttrs {
    version = "6.4";
    patches = [
      ./dotfiles/dwm/patches/dwm-xrdb-6.4.diff
      ./dotfiles/dwm/patches/dwm-systray-6.4.diff
      ./dotfiles/dwm/patches/my_dwm_patch.diff
    ];
  };

  python3 = pkgs.python311Full.buildEnv.override {
    extraLibs = [ 
      pkgs.python311Full.pkgs.pip
    ];
  };
  helpers = import ./helpers.nix {
    inherit pkgs;
    inherit lib;
  };
in [

    # Desktop management
    pkgs.dmenu     # Suckless' menu
    dwm            # Suckless' desktop manager
    pkgs.dwmbar    # Suckless' bar
    pkgs.picom     # X11 composer for opacity https://github.com/yshui/picom
    pkgs.nerdfonts # A lot of fonts with icons
    pkgs.dolphin   # A file manager by KDE

    # Browser
    pkgs.firefox

    # Terminal
    (helpers.nixGLWrap pkgs.alacritty)  # Alacritty uses OpenGL, nixGLWrap required to run on non-NixOS distros
    pkgs.tmux                           # A Terminal multiplexor

    # System preferences
    pkgs.pavucontrol          # sound control (Pulse Audio)
    pkgs.networkmanagerapplet # Network Manager GUI

    # Utilities
    pkgs.unzip
    pkgs.git
    pkgs.xclip   # X11 Clipboard
    pkgs.ripgrep # For recursive search
    
    # Editors 
    pkgs.neovim
    pkgs.feh     # Image viewer, set background

    # Compilers
    python3
    pkgs.cargo # Rust dependencies manager
  ]
