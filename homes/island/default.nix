{ pkgs, lib, username, ... }:

{
  # Modules
  modules.home-manager.btop.enable = true;
  modules.home-manager.fastfetch.enable = true;
  modules.home-manager.fonts.enable = true;
  modules.home-manager.git.enable = true;
  modules.home-manager.hyprland = {
    enable = true;
    lockBGPath = ./assets/night.jpg;
  };
  modules.home-manager.kitty.enable = true;
  modules.home-manager.mako.enable = true;
  modules.home-manager.nh.enable = true;
  modules.home-manager.phinger-cursor-theme.enable = true;
  modules.home-manager.rofi.enable = true;
  modules.home-manager.screenshot.enable = true;
  modules.home-manager.starship.enable = true;
  modules.home-manager.swww = {
    enable = true;
    switcher =
      (lib.concatStringsSep " "
        [
          (import ./scripts/swww.nix pkgs)
          ./assets/morning.jpg
          ./assets/day.jpg
          ./assets/evening.jpg
          ./assets/night.jpg
        ]
      );
  };
  modules.home-manager.vscode.enable = true;
  modules.home-manager.waybar.enable = true;
  modules.home-manager.zen-browser.enable = true;
  modules.home-manager.zsh.enable = true;

  # Colors
  modules.home-manager.colors = {
    enable = true;
    primary = "09849B";
    primaryHighlight = "5CC1A1";
    primaryLowlight = "023354";
    secondary = "429346";
    secondaryHighlight = "55B16B";
    secondaryLowlight = "123C2F";
    neutralLight = "D6E1DF";
    neutralDark = "020F1B";
  };

  # Other
  home.packages = [
    pkgs.unzip # software for unzipping zip archives
  ];

  programs.home-manager.enable = true; # let HM control itself
  home.username = username; # set the username at the home level
  home.homeDirectory = "/home/${username}"; # indicate which directory contains the home
  home.stateVersion = "24.05"; # Required for backwards compat during updates
}
