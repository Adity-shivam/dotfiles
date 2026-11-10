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

  # do nh clean all
  # nix-collect-garbage -d
  # nix store optimise

  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];
}

