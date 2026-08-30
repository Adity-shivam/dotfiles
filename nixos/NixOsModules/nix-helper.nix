{ pkgs, ... }:
{
  # Enable yet-another-nix-helper
    programs.nh = {
      enable = true;
      flake = "/home/adi/dotfiles/nixos";
      clean.enable = true;
      clean.dates = "weekly";
      clean.extraArgs = "--keep 8 --keep-since 5d";
    };
  
    environment.systemPackages = with pkgs; [ 
      nvd
      nix-output-monitor
    ];
}
