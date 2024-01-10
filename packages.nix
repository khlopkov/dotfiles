pkgs: with pkgs; 
  let dwm = pkgs.dwm.overrideAttrs {
    # TODO: build from patches
    src = ~/.local/src/dwm;
  };

  st = pkgs.st.overrideAttrs {
    # TODO: build from patches
    src = ~/.local/src/st;
  };
in [

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    pkgs.git
    pkgs.neovim

    # Suckless tools
    st
    pkgs.dmenu
    dwm

    # Browser
    pkgs.librewolf

    # Terminal
    pkgs.rxvt-unicode
    pkgs.vte

    # System preferences
    pkgs.pavucontrol

    pkgs.nerdfonts
    pkgs.unzip
    

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
