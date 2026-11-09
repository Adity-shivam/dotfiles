{ config, pkgs, ... }:

{
  # Enable Desktop Environment
  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;
  services.desktopManager.cosmic.showExcludedPkgsWarning = true;
  environment.cosmic.excludePackages = [ pkgs.cosmic-reader ];

  services.desktopManager.gnome.enable = true;

  services.udev.extraRules = ''
    # USB-Blaster
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"

    # USB-Blaster II
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
  '';

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

