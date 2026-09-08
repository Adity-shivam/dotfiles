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


# cabbrev <expr> W getcmdtype() == ':' && getcmdline() ==# 'W' ? 'w' : 'W'
# cabbrev <expr> Wq getcmdtype() == ':' && getcmdline() ==# 'Wq' ? 'wq' : 'Wq'
# cabbrev <expr> Wqa getcmdtype() == ':' && getcmdline() ==# 'Wqa' ? 'wqa' : 'Wqa'
# cabbrev <expr> WQ getcmdtype() == ':' && getcmdline() ==# 'WQ' ? 'wq' : 'WQ'
# cabbrev <expr> WQa getcmdtype() == ':' && getcmdline() ==# 'WQa' ? 'wqa' : 'WQa'
# cabbrev <expr> WQA getcmdtype() == ':' && getcmdline() ==# 'WQA' ? 'wqa' : 'WQA'
#
# cabbrev <expr> Q getcmdtype() == ':' && getcmdline() ==# 'Q' ? 'q' : 'Q'
# cabbrev <expr> Qa getcmdtype() == ':' && getcmdline() ==# 'Qa' ? 'qa' : 'Qa'
# cabbrev <expr> QA getcmdtype() == ':' && getcmdline() ==# 'QA' ? 'qa' : 'QA'



  };
}

