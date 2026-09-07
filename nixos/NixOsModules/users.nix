{ pkgs, ... }:
{
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
