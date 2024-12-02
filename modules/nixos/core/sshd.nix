# Enable and configure SSH daemon
# Required because SOPS uses the key
# DOCS: https://nixos.wiki/wiki/SSH
{lib, ...}: {
  services.openssh = {
    enable = true; # ssh daemon (sshd)
    settings = {
      X11Forwarding = true; # allow x11 (or xwayland) windows to be forwarded
      PermitRootLogin = lib.mkDefault "no"; # prohibit any root user logins because user accounts should be configured
      PasswordAuthentication = false; # disable password auth because keys should be enabled on accounts
      KbdInteractiveAuthentication = false; # disable other non-key authentication
    };
  };
  services.fail2ban.enable = true; # basic SSH security

  environment.persistence."/persistent".files = [
    "/etc/ssh/ssh_host_rsa_key"
    "/etc/ssh/ssh_host_ed25519_key"
  ];
}
