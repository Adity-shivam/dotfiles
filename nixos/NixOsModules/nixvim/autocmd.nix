{
  programs.nixvim.extraConfigLua = ''
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        local buf = vim.fn.bufnr()
        local last = vim.fn.line("$")
        -- Remove extra trailing blank lines, keeping at most one
        while last > 1 and vim.fn.getline(last) == "" and vim.fn.getline(last - 1) == "" do
          vim.fn.deletebufline(buf, last)
          last = last - 1
        end
        -- Ensure exactly one trailing newline
        if vim.fn.getline(last) ~= "" then
          vim.fn.append(last, "")
        end
      end,
    })
  '';
}

