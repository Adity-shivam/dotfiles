{
  # Disable Pulse Audio
    services.pulseaudio.enable = false;

  # Enable Pipewire
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      # jack.enable = true; # Enable for JACK application (low latency proffesional audio work)
    };

  # Enable Real Time kit service
    security.rtkit.enable = true;
}
