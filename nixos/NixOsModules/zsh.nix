{ pkgs, ... }:
{
  environment.shells = with pkgs; [ bash zsh ];
  
  # Enable zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cl = "clear";
    	v = "nvim";
    	# v = "vim";
    };
  };

}
