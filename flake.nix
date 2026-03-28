{
  description = "macOS configuration via nix-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations."macbook" = darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          {
            nixpkgs.overlays = [ (import ./overlays) ];
            nixpkgs.config.allowUnfree = true;
          }
          ./modules/darwin
          ./modules/brew
          ./modules/nix-packages
          
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.thomas = import ./modules/home-manager;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
}
