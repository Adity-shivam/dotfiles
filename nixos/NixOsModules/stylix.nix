{ pkgs, ... }:
{
  stylix.enable = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";

  stylix.image = ../EmbeddedDots/solar.png;

}
