{ pkgs, ... }:
{
  home.packages = [
    pkgs.gcx # Grafana CLI
  ];
}
