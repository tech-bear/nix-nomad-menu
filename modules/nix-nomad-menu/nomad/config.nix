{ config, lib, pkgs, ... }: 
let
  inherit (lib) mkIf;
  inherit (pkgs) callPackage;

  cfg = config.nix-nomad-menu.nomad;
  NoMAD = callPackage ../../../pkgs/NoMAD.nix { inherit pkgs; };
  bin = "${NoMAD}/bin/NoMAD.app";
  
  launchAgent = import ../helpers/launchAgent.nix { 
    enable = cfg.launchAgent.enable; 
    inherit bin;
  };
  userLaunchAgent = import ../helpers/launchAgent.nix { 
    enable = cfg.userLaunchAgent.enable; 
    inherit bin;
  };
in {
  config = mkIf cfg.enable {
    assertions = [];

    environment = {
      systemPackages = [NoMAD];
      launchAgents.nix-nomad-ad = mkIf launchAgent.enable launchAgent;
      userLaunchAgents.nix-nomad-ad = mkIf userLaunchAgent.enable userLaunchAgent;
    };
  };
}