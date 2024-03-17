{ pkgs, ... }:
let helpers = import ../../helpers.nix { inherit pkgs; };
in {
  imports = [
    ./irssi.nix
  ];

  home.packages = with pkgs; [
    (helpers.nixGLWrap
      alacritty) # Alacritty uses OpenGL, nixGLWrap required to run on non-NixOS distros
    neovim
    tmux # A Terminal multiplexor
    neofetch # Prints information about the system in a preatty way
    lazygit # A Git terminal viewer
    bc # Simple terminal calculator
    glow # Markdown viewer
    httpie # terminal HTTP client (curl alternative)
    jq # Pretty JSON formatter
    htop # list processes (top alternative)
    ripgrep # For recursive search
    diff-so-fancy # diff-so-fancy
    ollama # self-hosted AI chat bot
  ];

  home.file = {
    ".config/nvim".source = ./config/nvim;
    ".config/alacritty".source = ./config/alacritty;
    ".config/tmux".source = ./config/tmux;
    ".config/cspell.json".source = ./config/cspell.json;

    # Install Tmux Plugin Manager from the Github repository
    ".tmux/plugins/tpm".source = builtins.fetchGit {
      url = "https://github.com/tmux-plugins/tpm";
      rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    };
  };

  home.sessionVariables = { EDITOR = "nvim"; };

  programs.zsh = {
    enable = true;
    shellAliases = { vim = "nvim"; };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "gradle" "docker" ];
      theme = "robbyrussell";
    };

    profileExtra = "neofetch";
  };

}
