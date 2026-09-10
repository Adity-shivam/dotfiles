{ pkgs, inputs, ... }:

let 
  lib = inputs.nixvim.lib;
in

    # TODO: add plugins

    # lsp / luasnip
    # cmp | blink | coq
    # clangd-extensions.enable = true; cmake tools
    # nix
    # nvim-ufo
    # comform
    # quicker
    # dap debug 
    # lint
    # mini | autopair | autoclose
    # snacks

    # persistnace | tmux
    # neorg

    # Web browser grammer plugin

{
  lsp = {
    enable = true;
  };
}
