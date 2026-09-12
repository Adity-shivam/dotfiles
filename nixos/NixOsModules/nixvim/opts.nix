{
  programs.nixvim.globals = {
    have_nerd_font = true;
  };
  programs.nixvim.opts = {

    number = true;
    relativenumber = true;

    softtabstop = 2;
    tabstop = 2;
    expandtab = true;
    shiftwidth = 2;

    mouse = "c";
    mousefocus = true;
    copyindent = true;

    # undofile = false;
    # undodir = [ "~/.vim/undo" ];
    swapfile = false;

    ignorecase = true;
    smartcase = true;
    modeline = false;
    history = 100;

    hidden = true;

    incsearch = true;
    hlsearch = true;

    lazyredraw = true;
    showmatch = true;

    showcmd = true;
    laststatus = 2;

    breakindent = true;
    scrolloff = 10;
    signcolumn = "yes";
    cursorline = true;

    updatetime = 250;
    timeoutlen = 800;
    inccommand = "split";
    confirm = true;

    conceallevel = 1;
    showmode = false;

    foldenable = true;
    foldmethod = "indent";
    foldlevelstart = 10;
    foldnestmax = 10;

    completeopt = [
      "menu"
      "menuone"
      "noselect"
    ]; # For CMP plugin

    spell = false; # Highlight spelling mistakes (local to window)
    wrap = false; # Prevent text from wrapping

  };
  # thicken neotree seperator and color it
  programs.nixvim.opts.fillchars = {
    vert = "┃";
  };
  programs.nixvim.extraConfigVim = "highlight WinSeparator guifg=#31748f guibg=NONE";
}

