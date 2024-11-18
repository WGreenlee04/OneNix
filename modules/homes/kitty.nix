{ ... }:

{
  programs.kitty = {
    enable = true; # hyprland default terminal emulator
    settings = {
      shell = "zsh"; # shell command to execute at start time
      enable_audio_bell = false; # no sound
      update_check_interval = 0; # don't check for updates
      background_opacity = "0.8"; # slightly transparent background
    };
  };

  # Hyprland integration
  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, Q, exec, kitty"
  ];
}
