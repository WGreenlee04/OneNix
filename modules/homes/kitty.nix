{ inputs, pkgs, ... }:

{
  programs.kitty = {
    enable = true; # hyprland default terminal emulator
    settings = {
      enable_audio_bell = false; # no sound
      update_check_interval = 0; # don't check for updates
      background_opacity = "0.8"; # slightly transparent background
    };
    package = inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.kitty;
  };

  # Hyprland integration
  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, Q, exec, kitty"
  ];
}
