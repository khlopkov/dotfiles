{ pkgs, ... }:
let
  python3 = pkgs.python3;
in
{
  home.packages = [
    python3
    python3.pkgs.pip
  ];
}
