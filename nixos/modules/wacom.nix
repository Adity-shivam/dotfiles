{
  # Enable Wacom Tablet
    # services.xserver.wacom.enable = true;
    hardware.opentabletdriver.enable = true;
    hardware.opentabletdriver.daemon.enable = true; 

  # Enable extra vendor Drivers
    boot.initrd.unl0kr.allowVendorDrivers = true;
}

