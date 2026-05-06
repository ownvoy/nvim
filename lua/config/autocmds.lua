-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local markdown_diagnostics = vim.api.nvim_create_augroup("markdown_diagnostics", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = markdown_diagnostics,
  pattern = "markdown",
  callback = function(args)
    vim.opt_local.spell = false
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
  desc = "Disable diagnostics and spell checking in markdown buffers",
})
