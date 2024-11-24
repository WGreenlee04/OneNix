{ config, lib, pkgs, ... }:

let
  moduleName = "hyprland";
  cfg = config.modules.homes.${moduleName};
in
{
  options.modules.homes.${moduleName} = {
    enable = lib.mkEnableOption moduleName;
    lockBGPath = lib.mkOption { default = null; type = (lib.types.nullOr (lib.types.uniq lib.types.path)); };
  };

  imports = [
    ./binds.nix
    ./decoration.nix
    ./dwindle.nix
    ./general.nix
    ./group.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./input.nix
    ./misc.nix
    ./monitors.nix
    ./windowrules.nix
  ];

  config = lib.mkIf cfg.enable {
    # Required dependencies for this module
    home.packages = [
      pkgs.hyprpicker # color picker for hyprland
      pkgs.wl-clipboard-rs # wl-clipboard implementation, required for hyprpicker -a
      pkgs.hyprpolkitagent # polkit agent
    ];

    home.sessionVariables.NIXOS_OZONE_WL = "1"; # make electron apps use wayland

    # Hyprland config
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        exec-once = [
          "hypridle" # start idle daemon
          "systemctl --user start hyprpolkitagent" # start polkit daemon
        ];
      };
    };
    services.hypridle.enable = true; # hyprland idle daemon
    programs.hyprlock.enable = true; # hyprland lock screen
  };
}
