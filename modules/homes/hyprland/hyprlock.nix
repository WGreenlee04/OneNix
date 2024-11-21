{ config, ... }:

let
  bgPath = config.modules.homes.hyprland.lockBGPath;
  colors = config.modules.homes.colors;
in
{
  programs.hyprlock = {
    enable = true; # hyprland lock screen
    settings = {
      general =
        {
          grace = "3"; # seconds before lock actually engages
        };
      background = [
        {
          monitor = ""; # active monitor
          path = if bgPath != null then (toString bgPath) else ""; # use screenshot of desktop
          color = "rgba(${colors.neutralDark}FF)"; # fallback color for no background
          blur_passes = "3"; # smooth blur
        }
      ];
      input-field = [
        # Input Box
        {
          monitor = ""; # all monitors
          size = "300, 60";
          outline_thickness = "2";
          dots_size = "0.1"; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = "0.25"; # Scale of dots' absolute size, 0.0 - 1.0
          outer_color = "rgba(${colors.neutralDark}00)";
          inner_color = "rgba(${colors.neutralDark}A5)";
          font_color = "rgb(${colors.neutralLight})";
          position = "0, -200"; # offset from center of screen;
        }
      ];
      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgba(242, 243, 244, 0.8)";
          font_size = "22";
          position = "0, 300"; # offset from center of screen
        }
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(242, 243, 244, 0.8)";
          font_size = "95";
          position = "0, 200"; # offset from center of screen
        }
        # User Greeting
        {
          monitor = "";
          text = "Hello $DESC";
          color = "rgba(242, 243, 244, 0.8)";
          font_size = "22";
          position = "0, -150"; # offset from center of screen
        }
      ];
    };
  };
}
