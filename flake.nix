{
  description = "Flake for installing and configuring nomad.menu products";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default-darwin";
  };

  outputs = { self, nixpkgs, systems } @inputs:
  let 
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    packages = eachSystem (system: 
    let 
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      NoMAD = pkgs.callPackage ./pkgs/NoMAD.nix {
        inherit pkgs;
      };
    });

    devShells = eachSystem(system: {
      NoMAD = nixpkgs.legacyPackages.${system}.mkShell {
        nativeBuildInputs = with nixpkgs.legacyPackages.${system}; [
          xcodebuild
        ];
      };
    });

    darwinModules.nix-nomad-menu = {config, options, lib, pkgs, ...}: import ./modules/nix-nomad-menu {
      inherit config;
      inherit options;
      inherit lib;
      inherit pkgs;
    };
  };
}
