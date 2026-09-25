{
  # Enable bootloader
  # boot.loader = {
  #   systemd-boot.enable = true;
  #   efi.canTouchEfiVariables = true;
  # };
  #

  boot.loader = {
    efi.canTouchEfiVariables = true;

    limine = {
      enable = true;
      validateChecksums = true;
      maxGenerations = 15;

      efiSupport = true;
      secureBoot.enable = false;

      extraConfig = ''
        timeout: 3
        INTERFACE_RESOLUTION=1920x1080
        remember_last_entry: yes
        term_font_scale: 2x2
      '';

      style = {
        wallpapers = [ ../EmbeddedDots/solar.png ];
        wallpaperStyle = "centered";
      };
    };

  };
}

