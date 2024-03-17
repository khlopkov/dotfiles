{ pkgs, ... }:
let
  polybar = pkgs.polybar.override {
    i3Support = true;
    i3 = pkgs.i3;
    pulseSupport = true;
  };
in {
  home.packages = with pkgs; [
    # Desktop management
    i3
    i3ipc-glib
    # TODO replace with Rofi
    dmenu
    polybar

    picom # X11 composer for opacity https://github.com/yshui/picom
    nerdfonts # A lot of fonts with icons
    pcmanfm # A file manager
    feh # Image viewer, set background
    sxhkd # X11 keybindings daemon

    # System preferences
    pavucontrol # sound control (Pulse Audio)
    networkmanagerapplet # Network Manager GUI
    xclip # X11 Clipboard
  ];

  home.file = {
    ".config/dwmbar".source = ./config/dwmbar;
    ".config/sxhkd".source = ./config/sxhkd;
    ".config/i3".source = ./config/i3;
    ".config/polybar".source = ./config/polybar;

    ".Xresources".source = ./config/Xresources;
    ".xinitrc".source = ./config/xinitrcI3;
    ".wallpaper.jpg".source = ./config/wallpaper.jpg;
  };

  fonts.fontconfig.enable = true;

  home.sessionVariables = { XDG_CURRENT_DESKTOP = "i3"; };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    configPackages = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  qt = {
    enable = true;
    platformTheme = "gtk3";
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
  };
}
