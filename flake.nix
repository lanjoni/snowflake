{
  description = "snowflake config for guto's macbook pro";
  
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-23.11
    nixpkgs.url = "github:NixOS/nixpkgs/d8e0944e6d2ce0f326040e654c07a410e2617d47";
    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    nixpkgs-firefox-nightly.url = "github:colemickens/flake-firefox-nightly";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, darwin, ... }: {
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
            users.guto.imports = [ 
	      # NixVim module
              nixvim.homeManagerModules.nixvim 
              ./modules/home-manager 
            ];
          };
        }
      ];
    };
  };
}
