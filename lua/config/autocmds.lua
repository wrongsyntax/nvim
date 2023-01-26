-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Start NERDTree and put the cursor back in the other window.
vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "NERDTree | wincmd p" })

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd(
      "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
    )
  end,
})
-- Close the tab if NERDTree is the only window remaining in it.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd("if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")
  end,
})
