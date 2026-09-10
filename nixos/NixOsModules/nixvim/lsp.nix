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
    servers = [
      clangd = {
        config = {
          cmd = [
            "clangd"
            "--background-index"
          ];
          filetypes = [
            "c"
            "cpp"
          ];
          root_markers = [
            "compile_commands.json"
            "compile_flags.txt"
          ];
        };
        enable = true;
      };
    

    ];
  

  };
}
