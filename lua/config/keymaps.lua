-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- Neo-tree keymaps (Lua)
local map = vim.keymap.set

-- 항상 source를 명시해서 nil 에러 방지
map("n", "<leader>e", "<cmd>Neotree toggle source=filesystem reveal left<CR>", { desc = "Neo-tree: Filesystem" })
map("n", "<leader>E", "<cmd>Neotree focus  source=filesystem        left<CR>", { desc = "Neo-tree: Focus FS" })
map("n", "<leader>ob", "<cmd>Neotree toggle source=buffers           left<CR>", { desc = "Neo-tree: Buffers" })
map("n", "<leader>og", "<cmd>Neotree toggle source=git_status        left<CR>", { desc = "Neo-tree: Git status" })

-- ===== Paste =====
-- Insert/Command/Terminal 모드에서 Ctrl-Shift-V / Ctrl-V => 시스템 클립보드 붙여넣기
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste(+)" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste(+)" })
vim.keymap.set("c", "<C-S-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste(+)" })
vim.keymap.set("c", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste(+)" })
-- 터미널 모드: Neovim 터미널 버퍼 안에서 붙여넣기
vim.keymap.set("t", "<C-S-v>", [[<C-\><C-n>"+pa]], { noremap = true, silent = true, desc = "Paste(+)" })
vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+pa]], { noremap = true, silent = true, desc = "Paste(+)" })

-- Normal/Visual 모드에서 Ctrl-Shift-V만 붙여넣기로. (Ctrl-V는 블록비주얼이라 안 건드림)
vim.keymap.set("n", "<C-S-v>", '"+p', { noremap = true, silent = true, desc = "Paste(+)" })
vim.keymap.set("x", "<C-S-v>", '"+p', { noremap = true, silent = true, desc = "Paste(+)" })

-- ===== Copy (원하면) =====
-- Visual에서 Ctrl-C로 시스템 클립보드 복사
vim.keymap.set("x", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Yank(+)" })

-- 터미널 모드에서 jk  → Normal 모드
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { noremap = true })
