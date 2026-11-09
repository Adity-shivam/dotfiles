{ config, pkgs, ... }:

{
  # Enable Desktop Environment
  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;
  services.desktopManager.cosmic.showExcludedPkgsWarning = true;
  environment.cosmic.excludePackages = [ pkgs.cosmic-reader ];

  environment.systemPackages = with pkgs; [
    woomer
    gromit-mpx

    cosmic-ext-applet-caffeine
    # cosmic-ext-tweaks
    cosmic-ext-applet-minimon
    cosmic-ext-applet-privacy-indicator
    cosmic-ext-applet-weather

    # snapshot
    # gnome-sound-recorder
    papers
    eog
  ];
}

