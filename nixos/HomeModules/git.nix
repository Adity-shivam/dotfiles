{ pkgs, ... }:
{
  # Enable git
  programs.git = {
    enable = true;
    ignores = [ "*.un~" "*.swp" ];
    # hooks = { pre-commit = ./pre-commit-script; };

    settings = {
    	user.name = "Adity-shivam";
    	user.email = "adishivam1507@gmail.com";
    	init.defaultBranch = "main";
    };
  };
}
