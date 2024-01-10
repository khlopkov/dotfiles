{ config, pkgs, ... }:
  #let dwm = pkgs.dwm.override {
  #  patches = [(pkgs.fetchpatch {
  #    url = "https://dwm.suckless.org/patches/xrdb/dwm-xrdb-6.4.diff";
  #    hash = "sha256-A74O/fMnOoWKy6CaGBj6f96kvNEvuxZC+4/Prv67Y3Q=";
  #  })];
  #};
  let dwm = pkgs.dwm.overrideAttrs {
    src = ~/.local/src/dwm;
  };

  st = pkgs.st.overrideAttrs {
    src = ~/.local/src/st;
  };

in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "etsilence";
  home.homeDirectory = "/home/etsilence";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
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
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/etsilence/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.termite = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  xresources.properties = {
    "Xft.dpi"    = 192;
    #"URxvt.font" = "xft:DroidSansM Nerd Font:size=10";
    "st.font" = "Hack Nerd Font Mono:size=18:antialias=true:autohint=true";

    # special
    "*.foreground"  =  "#c7ccd1";
    "*.background"  =  "#1c2023";
    "*.cursorColor" =  "#c7ccd1";

    # black
    "*.color0" =       "#1c2023";
    "*.color8" =       "#747c84";

    # red
    "*.color1" =       "#c7ae95";
    "*.color9" =       "#c7ae95";

    # green
    "*.color2" =       "#95c7ae";
    "*.color10" =      "#95c7ae";

    # yellow
    "*.color3" =       "#aec795";
    "*.color11" =      "#aec795";

    # blue
    "*.color4" =       "#ae95c7";
    "*.color12" =      "#ae95c7";

    # magenta
    "*.color5" =       "#c795ae";
    "*.color13" =      "#c795ae";

    # cyan
    "*.color6" =       "#95aec7";
    "*.color14" =      "#95aec7";

    # white
    "*.color7" =       "#c7ccd1";
    "*.color15" =      "#f3f4f5";

  };

}

