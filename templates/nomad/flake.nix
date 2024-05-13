{
  description = "Example flake for setting up NoMAD";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    aarch64-darwin.url = "github:nix-systems/aarch64-darwin";
    x86_64-darwin.url = "github:nix-systems/x86_64-darwin";
    nix-nomad-menu.url = "github:tech-bear/nix-nomad-menu";
    nix-nomad-menu.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, nix-darwin, aarch64-darwin, x86_64-darwin, nix-nomad-menu } @inputs: {
    darwinConfigurations = {
      aarch64-darwin = let 
        system = import aarch64-darwin;
      in nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          nix-nomad-menu.darwinModules.nix-nomad-menu {
            nix-nomad-menu.nomad = {
              # Enable the NoMAD application
              enable = true;

              # Creates a system launchAgent to start NoMAD at boot
              launchAgent.enable = true;

              # Creates a user launchAgent to start NoMAD at boot
              # Note that users can delete this file from their home directory
              userLaunchAgent.enable = true;
            };
          }
          {
            nixpkgs.hostPlatform = nixpkgs.lib.lists.last system;
          }
        ];
      };
      x86_64-darwin = let 
        system = import x86_64-darwin;
      in nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          nix-nomad-menu.darwinModules.nix-nomad-menu {
            nix-nomad-menu.nomad = {
              # Enable the NoMAD application
              enable = true;

              # Creates a system launchAgent to start NoMAD at boot
              launchAgent.enable = true;

              # Creates a user launchAgent to start NoMAD at boot
              # Note that users can delete this file from their home directory
              userLaunchAgent.enable = true;
            };
          }
          {
            nixpkgs.hostPlatform = nixpkgs.lib.lists.last system;
          }
        ];
      };
    };
  };
}