{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl = {
      url = "github:guibou/nixGL"; 
      # Probably better to remove to work with pinned nixpkgs from of nixGL's inputs.
      # Though it works with current nixpkgs, though will work with the same version as home environment
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixgl, nixpkgs, home-manager, ... }:
    let
      cfg = import ./config.nix;
      pkgs = import nixpkgs {
        system = cfg.system;
        overlays = [ nixgl.overlay ];
      };
    in {
      homeConfigurations."${cfg.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
