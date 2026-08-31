{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "adi";
  home.homeDirectory = "/home/adi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-40.10.5" ];  
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.xournalpp
    pkgs.rnote
    pkgs.obsidian
    pkgs.arduino-ide
    pkgs.zed-editor
    pkgs.kicad
    pkgs.freecad
    pkgs.blender
    pkgs.fritzing
    pkgs.logisim
    pkgs.winboat    
    pkgs.gcc
      
    inputs.zen-browser.packages.x86_64-linux.default
  ];

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

  # Enable vim
  programs.vim = {
    enable = true;
    defaultEditor = true;

    plugins = [ pkgs.vimPlugins.nerdtree pkgs.vimPlugins.nerdtree-git-plugin ];

    settings = {
      
      # background = "dark";
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
     
      mouse = "c";
      mousefocus = true;
      copyindent = true;
     
      undofile = false;
      ignorecase = true;
      smartcase = true;
      modeline = false;
      history = 100;
     
      hidden = true;
    };
    extraConfig = builtins.readFile ./EmbeddedDots/vimrc;

  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/adi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
