{
  # Enable NixVim
  programs.nixvim = {
    enable = true;
    viAlias = true;
    colorschemes.gruvbox.enable = true;

    options = {
      number = true;
      relativenumber = true;
    };

  };
  

}
