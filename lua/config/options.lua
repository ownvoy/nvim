-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
virtual_text = true

-- vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h14"
vim.o.guifont = "Cascadia Code NF:h14"
vim.g.neovide_opacity = 1.0
vim.g.neovide_background_color = "#1E1E2EE6"
-- vim.g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * 0.8))
vim.g.neovide_padding_top = 60
vim.g.neovide_padding_bottom = 60
vim.g.neovide_padding_right = 40
vim.g.neovide_padding_left = 40

vim.o.shell = "bash --login"
