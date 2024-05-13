{ lib, ... }: 
let
  inherit(lib) mkEnableOption mkOption types;

  enable = mkEnableOption {
    description = lib.mkDoc ''
      Installs NoMAD
    '';
    type = types.bool;
    default = false;
  };

  launchAgent.enable = mkEnableOption {
    description = lib.mkDoc ''
      Creates a system LaunchAgent that starts NoMAD on boot
    '';
    type = types.bool;
    default = false;
  };

  userLaunchAgent.enable = mkEnableOption {
    description = lib.mkDoc ''
      Creates a user LaunchAgent that starts NoMAD on boot.
      Note that users can delete this file from their home directory
    '';
    type = types.bool;
    default = false;
  };

in {
  options.nix-nomad-menu.nomad = {
    inherit enable;
    inherit launchAgent;
    inherit userLaunchAgent;
  };
}