pkgs: with pkgs; 
  let dwm = pkgs.dwm.overrideAttrs {
    version = "6.4";
    patches = [
      ./dotfiles/dwm/patches/dwm-xrdb-6.4.diff
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

    # Suckless tools
    pkgs.dmenu
    dwm

    # Browser
    pkgs.firefox

    # Terminal
    (helpers.nixGLWrap pkgs.alacritty)

    #Editors 
    pkgs.neovim

    # System preferences
    pkgs.pavucontrol
    pkgs.nerdfonts

    # Utilities
    pkgs.unzip
    pkgs.git
    pkgs.xclip # X11 Clipboard
    pkgs.ripgrep # For recursive search
    
    # Compilers
    python3
    pkgs.cargo
  ]
