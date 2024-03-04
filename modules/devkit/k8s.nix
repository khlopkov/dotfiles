{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubectl
    kubectx
  ];

  programs.zsh = {
    shellAliases = { 
      k = "kubectl";
      kns = "kubens";
      kctx = "kubectx";
    };

    oh-my-zsh = {
      plugins = [ "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
