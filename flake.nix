{
  description = "snowflake config for guto's macbook pro";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-23.11
    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    nixpkgs-firefox-nightly.url = "github:colemickens/flake-firefox-nightly";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations.artemis = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs { 
        system = "aarch64-darwin";
        config.allowUnfree = true; 
      };
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.guto.imports = [ ./modules/home-manager ];
          };
        }
      ];
    };
  };
}
