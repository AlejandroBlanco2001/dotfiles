{
    description = "NixOS";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        home-manager = {
          url = "github:nix-community/home-manager/release-26.05";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        ghostty.url = "github:ghostty-org/ghostty";

        lanzaboote = {
          url = "github:nix-community/lanzaboote/v1.1.0";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = { self, nixpkgs, home-manager, ghostty, lanzaboote, ... }: {
        nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
           system = "x86_64-linux";
           modules = [
             ./configuration.nix
             lanzaboote.nixosModules.lanzaboote
             home-manager.nixosModules.home-manager
             {
                 home-manager = {
                     useGlobalPkgs = true;
                     useUserPackages = true;

                     extraSpecialArgs = {
                         inherit ghostty;
                     };

                     users.isaac = import ./home.nix;
                     backupFileExtension = "backup";
                 };
             }
           ];
        };
    };
}
