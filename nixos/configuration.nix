# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./NixOsModules
    ];

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "Nix-Chan"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
 
  # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    # nixpkgs.config.permittedInsecurePackages = [ "electron-40.10.5" ];  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      fastfetch
      wget
      fzf
      btop

    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable Zsh
    environment.shells = with pkgs; [ bash zsh ];
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        cl = "clear";
      	# v = "nvim";
      	v = "vim";
      };
    };

  # Enable git
    programs.git = {
      enable = true;
      config = {
      	user.name = "Adity-shivam";
      	user.email = "adishivam1507@gmail.com";
      	init.defaultBranch = "main";
      };
    };

  # Enable Web Browser
    programs.firefox = {
      enable = true;
      policies.Homepage.StartPage = "https://nixos.org";
      policies.DisableTelemetry = true;
    };

  # Enable neovim
    programs.neovim = {
      enable = true;
      defaultEditor = false;

      # extraPackages = [
      #
      # ];
    };

  # Enable vim
    programs.vim = {
      enable = true;
      defaultEditor = true;

    };

  # Enable CUPS to print documents
    services.printing.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh = {
      enable = true;
    };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?


  ### Home-Manager

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "adi" = import ./home.nix;
    };

  };

}
