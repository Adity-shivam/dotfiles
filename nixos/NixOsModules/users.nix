{ pkgs, ... }:
{
  # Enable Zsh
    users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.adi = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Aditya Shivam";
      extraGroups = [ "networkmanager" "wheel" "dialout" "docker" ];
      packages = with pkgs; [ ];
    };


  #  services.getty.autologinOnce = true;
  #  services.getty.autologinUser = "adi";

}
