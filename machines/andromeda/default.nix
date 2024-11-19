modules:

{ inputs, hostname, ... }:

{
  imports = [
    modules.bluetooth
    modules.hyprland
    modules.nvidia
    modules.pipewire
    modules.printing
    modules.sddm
    modules.steam
    modules.systemd-boot
    ./hardware-configuration.nix
  ];

  time.timeZone = "America/Louisville"; # based on location of the machine
  networking.hostName = hostname; # network host name
  networking.networkmanager.enable = true; # automatically connects to network when possible
  system.stateVersion = "24.05";
}
