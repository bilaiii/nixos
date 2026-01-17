{

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager =  {
			url = "github:nix-community/home-manager"; 
			inputs.nixpkgs.follows = "nixpkgs";
		};
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      mangowc,
      neovim-nightly-overlay,
			home-manager
    }@inputs:
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit neovim-nightly-overlay; };
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
          ./configuration.nix
          mangowc.nixosModules.mango
					home-manager.nixosModules.home-manager {
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.backupFileExtension = "backup";
							home-manager.users.bilaii = import ./home.nix;
						}
        ];
      };

    };

}
