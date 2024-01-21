{ pkgs, ... }:
{
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
  home.packages = import ./packages.nix pkgs;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/alacritty".source = ./dotfiles/alacritty;
    ".config/dwmbar".source = ./dotfiles/dwmbar;
    ".config/tmux".source = ./dotfiles/tmux;
    ".config/sxhkd".source = ./dotfiles/sxhkd;

    ".Xresources".source = ./dotfiles/Xresources;
    ".xinitrc".source = ./dotfiles/xinitrc;
    ".wallpaper.jpg".source = ./dotfiles/wallpaper.jpg;

    # Install Tmux Plugin Manager from the Github repository
    ".tmux/plugins/tpm".source = builtins.fetchGit {
      url = "https://github.com/tmux-plugins/tpm";
      rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    };
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
    shellAliases = {
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  fonts.fontconfig.enable = true;
}

