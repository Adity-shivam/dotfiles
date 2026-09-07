{ pkgs, ... } :

{
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
      vim
      git
    ];

    fonts.packages = with pkgs; [
      jetbrains-mono
#       noto-fonts
#       noto-fonts-emoji
#       twemoji-color-font
#       font-awesome
#       powerline-fonts
#       powerline-symbols
  ];

###  # Enable Web Browser system-wide
###    programs.firefox = {                                
###      enable = true;
###      policies.Homepage.StartPage = "https://nixos.org";
###      policies.DisableTelemetry = true;
###    }


}
