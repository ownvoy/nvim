-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
virtual_text = true

-- vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h14"
vim.o.guifont = "Cascadia Code NF:h14"
vim.g.neovide_opacity = 0.82
vim.g.neovide_normal_opacity = 0.82
vim.g.neovide_padding_top = 60
vim.g.neovide_padding_bottom = 60
vim.g.neovide_padding_right = 40
vim.g.neovide_padding_left = 40

vim.o.shell = "bash --login"
