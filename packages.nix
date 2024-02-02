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
  };

  # See compatibility matrix
  # https://docs.gradle.org/current/userguide/compatibility.html
  jdk    = pkgs.jdk20;
  gradle = (callPackage gradle-packages.gradle_8 {
             java = jdk;
           });
in [

    # Desktop management
    pkgs.dmenu     # Suckless' menu
    dwm            # Suckless' desktop manager
    pkgs.dwmbar    # Suckless' bar
    pkgs.picom     # X11 composer for opacity https://github.com/yshui/picom
    pkgs.nerdfonts # A lot of fonts with icons
    pkgs.pcmanfm   # A file manager by KDE
    pkgs.feh       # Image viewer, set background
    pkgs.sxhkd     # X11 keybindings daemon

    # Browser
    pkgs.firefox

    # System preferences
    pkgs.pavucontrol          # sound control (Pulse Audio)
    pkgs.networkmanagerapplet # Network Manager GUI

    # Utilities
    pkgs.unzip
    pkgs.git
    pkgs.xclip   # X11 Clipboard
    pkgs.ripgrep # For recursive search
    
    # Editors 
    pkgs.jetbrains.idea-community

    # Compilers and dev tools
    python3
    pkgs.rustup # Rust toolchain manager
    jdk         # Java DevKit 21
    gradle      # Gradle build tool for Java projects
    pkgs.go     # golang pkg
    docker-compose

    # Messengers
    (helpers.nixGLWrap pkgs.telegram-desktop)  # Telegram uses OpenGL, nixGLWrap required to run on non-NixOS distros
  ]
