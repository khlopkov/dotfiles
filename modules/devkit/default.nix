{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./k8s.nix
    ./java.nix
    ./gcloud.nix
    ./python.nix
    ./network.nix
  ];

  home.packages = with pkgs; [
    rustup # Rust toolchain manager
    docker-compose
    git
    nodejs
    nixfmt-rfc-style
    php
    phpunit
  ];
}
