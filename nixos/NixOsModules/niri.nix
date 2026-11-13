{ pkgs, ... }:

{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite

    foot
    fuzzel
    waybar
    mako

    wl-clipboard
    grim
    slurp
    swaybg

    playerctl
    brightnessctl
    pavucontrol
  ];

}

