{ pkgs, ... }: {

  home.packages = with pkgs; [
    inetutils
    mtr
    curl
  ];
}
