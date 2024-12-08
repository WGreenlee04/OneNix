{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/persistent" = {
    hideMounts = true; # don't make the bind mounts visible in the mount table
    directories = [
      "/var/log" # logs
      "/var/lib/systemd/coredump" # coredumps
      "/var/tmp" # tmp files persisted across reboots
      "/var/lib/nixos" # necessary nixos state
    ];
    files = [
      "/etc/adjtime" # hardware clock offset
      "/etc/machine-id" # nixos expects this to be persistent
    ];
  };

  # Swap for low-memory systems
  swapDevices = [
    {
      device = "/var/tmp/swapfile";
      size = 32 * 1024; # 48 GiB
    }
  ];
}
