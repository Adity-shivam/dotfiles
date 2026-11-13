{ pkgs, ... }:
{
  environment.shells = with pkgs; [
    bash
    zsh
  ];

  environment.systemPackages = [
    pkgs.bat
    pkgs.eza
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

      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
    '';
    # ohMyZsh.enable = true;

    shellAliases = {
      cl = "clear";
      v = "nvim";
      # v = "vim";
      ".." = "cd ..";
      logout = "loginctl terminate-user $(id -u)";

      ls = "eza --icons";
      ll = "eza -lah --icons --git";
      tree = "eza --tree --icons";

      cat = "bat --style=plain --paging=never";

    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {

      nix_shell = {
        disabled = false;
        heuristic = true;
        symbol = "❄️ ";
        style = "bold blue";
        format = "[$symbol$state( \\($name\\))]($style) ";
      };

      add_newline = true;

      format = ''
        $username$hostname$directory$git_branch$git_status
        $character
      '';

      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        format = " [$symbol$branch]($style)";
        style = "bold purple";
        symbol = " ";
      };

      git_status = {
        style = "bold red";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      username = {
        show_always = false;
        style_user = "bold yellow";
      };

      hostname = {
        ssh_only = true;
        style = "bold green";
      };

      cmd_duration = {
        min_time = 2000;
        format = "took [$duration](bold yellow)";
      };
    };
  };

}

