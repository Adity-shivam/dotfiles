# {
#   # Enable CUPS to print documents
#   services.printing = {
#     enable = true;
#     # drivers = [ pkgs.gutenprint ];
#   };

# }

{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-filters ]; # Add extra drivers if required
  };

  # For network printer discovery (IPP Everywhere / AirPrint)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    system-config-printer
  ];
}

