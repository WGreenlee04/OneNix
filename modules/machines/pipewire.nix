# Handles audio/videocap/bluetooth all in one
# DOCS: https://nixos.wiki/wiki/PipeWire
{ ... }:

{
  security.rtkit.enable = true; # realtime processing for latency reduction
  services = {
    pipewire = {
      enable = true; # pipewire daemon
      alsa.enable = true; # alsa compat support
      alsa.support32Bit = true; # 32-bit (hifi) alsa support
      pulse.enable = true; # pulseaudio compat support
      jack.enable = true; # jack app support (common in low latency environments)
    };
  };
}
