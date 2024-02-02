pkgs:
  let
  helpers = import ../../helpers.nix {
    inherit pkgs;
  };
in {

  home.file = {
    ".config/nvim".source = ./config/nvim;
    ".config/alacritty".source = ./config/alacritty;
    ".config/tmux".source = ./config/tmux;

    # Install Tmux Plugin Manager from the Github repository
    ".tmux/plugins/tpm".source = builtins.fetchGit {
      url = "https://github.com/tmux-plugins/tpm";
      rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git"
        "gradle"
        "docker"
      ];
      theme = "robbyrussell";
    };

    profileExtra = "neofetch";
  };

  home.packages = [
    (helpers.nixGLWrap pkgs.alacritty)  # Alacritty uses OpenGL, nixGLWrap required to run on non-NixOS distros
    pkgs.neovim
    pkgs.tmux                           # A Terminal multiplexor
    pkgs.neofetch                       # Prints information about the system in a preatty way
    pkgs.lazygit                        # A Git terminal viewer
    pkgs.bc                             # Simple terminal calculator
    pkgs.glow                           # Markdown viewer
    pkgs.httpie                         # terminal HTTP client (curl alternative)
    pkgs.jq                             # Pretty JSON formatter
    pkgs.htop                           # list processes (top alternative)
  ];
}
