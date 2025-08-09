{ pkgs, ... }:
let
  dwm = pkgs.dwm.overrideAttrs {
    version = "6.4";
    patches = [
      ./config/dwm/patches/dwm-xrdb-6.4.diff
      ./config/dwm/patches/dwm-systray-6.4.diff
      ./config/dwm/patches/my_dwm_patch.diff
    ];
  };
in
{
  home.packages = with pkgs; [
    # Desktop management
    dmenu # Suckless' menu
    dwm # Suckless' desktop manager
    dwmbar # Suckless' bar
    picom # X11 composer for opacity https://github.com/yshui/picom
    nerdfonts # A lot of fonts with icons
    pcmanfm # A file manager by KDE
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

    ".Xresources".source = ./config/Xresources;
    ".xinitrc".source = ./config/xinitrc;
    ".wallpaper.jpg".source = ./config/wallpaper.jpg;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "dwm";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    configPackages = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  fonts.fontconfig.enable = true;

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
