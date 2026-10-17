{ pkgs, ... }:
{
  environment.shells = with pkgs; [
    bash
    zsh
  ];

  # Enable zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;

    interactiveShellInit = ''
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
    '';
    # ohMyZsh.enable = true;

    shellAliases = {
      cl = "clear";
      v = "nvim";
      # v = "vim";
      ".." = "cd ..";
      logout = "loginctl terminate-user $(id -u)";
    };
  };

}

