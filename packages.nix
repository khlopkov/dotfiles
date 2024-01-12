pkgs: with pkgs; 
  let dwm = pkgs.dwm.overrideAttrs {
    # TODO: build from patches
    src = ~/.local/src/dwm;
  };

  st = pkgs.st.overrideAttrs {
    # TODO: build from patches
    src = ~/.local/src/st;
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
    st
    pkgs.dmenu
    dwm

    # Browser
    pkgs.firefox

    # Terminal
    pkgs.rxvt-unicode
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

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ]
