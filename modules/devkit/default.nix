{ pkgs, ... }:
{
  imports = [
    ./k8s.nix
    ./java.nix
    ./gcloud.nix
    ./python.nix
  ];

  home.packages = with pkgs; [
    rustup # Rust toolchain manager
    go # golang pkg
    docker-compose
    git
    nodejs
    php
  ];

}
