{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     
     stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

   let
   	pkgs = nixpkgs.legacyPackages."x86_64-linux";
   in
    {
    	devShells."x86_64-linux" = {
		web = import ./devshells/web.nix { inherit pkgs; };
	};

	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
        	home-manager = {
        		useGlobalPkgs = true;
        		useUserPackages = true;
        		users.kurt = import ./hosts/nixos/home.nix;
        		backupFileExtension = "backup";
        	};
        }
        inputs.stylix.nixosModules.stylix 
      ];
    };
    };
}

