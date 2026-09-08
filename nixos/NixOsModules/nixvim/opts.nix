{
  programs.nixvim.opts = {

    # nocompatible = true;
    
    number = true;
    relativenumber = true;
  
    softtabstop = 2;
    tabstop = 2;
    expandtab = true;
    shiftwidth = 2;
    
    # mouse = "c";
    mousefocus = true;
    copyindent = true;
   
    # undofile = false;
    # undodir = [ "~/.vim/undo" ];
    ignorecase = true;
    smartcase = true;
    modeline = false;
    history = 100;
   
    hidden = true;
 
    incsearch = true;
    hlsearch = true;
    
    wildmenu = true;
#   ##syntax on 
    lazyredraw = true;
    showmatch = true;
    
    showcmd = true;
    laststatus = 2;
   
    breakindent = true;
    scrolloff = 10;
  
    conceallevel = 1;
    showmode = true;
 
#   ## nnoremap <Esc> <cmd>nohlsearch<CR>

    foldenable = true;
    foldmethod = "indent";
    foldlevelstart = 10;
    foldnestmax = 10;



  };
}

