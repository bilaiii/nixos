{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
			nixpkgs-stable,
      mangowc,
      neovim-nightly-overlay,
      home-manager,
			nixvim,
    }@inputs:
    let
      theme = import ./modules/home/theme.nix;
      system = "x86_64-linux";

    in
    {

      nixosConfigurations.think = nixpkgs.lib.nixosSystem {
        specialArgs = { 
					inherit neovim-nightly-overlay inputs;
				};
        modules = [
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ neovim-nightly-overlay.overlays.default ];
            }
          )
          {
            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }
          ./hosts/think/configuration.nix
          mangowc.nixosModules.mango
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs theme; };
            home-manager.users.bilaii = import ./home.nix;
          }
        ];
      };
    };
}
