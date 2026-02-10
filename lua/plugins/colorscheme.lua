-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
-- Lua-- Lua
--
return {

  { "catppuccin/nvim", name = "catppuccin" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      local ok, catpp_buf = pcall(require, "catppuccin.groups.integrations.bufferline")
      if ok and catpp_buf.get_theme then
        opts.highlights = catpp_buf.get_theme()
      elseif ok and catpp_buf.get then
        -- 구버전 호환
        opts.highlights = catpp_buf.get()
      end
      return opts
    end,
  },
}

-- return {
--   { "scottmckendry/cyberdream.nvim" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "cyberdream",
--     },
--   },
-- }
-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--       require("rose-pine").setup({
--         variant = "dawn", -- use "dawn" variant
--       })
--       vim.cmd("colorscheme rose-pine")
--     end,
--   },
-- }

-- return {
--   {"scottmckendry/cyberdream.nvim",
--   lazy = false,
--   priority = 1000}
-- {
-- "LazyVim/LazyVim",
-- opts = {
--   colorscheme = "cyberdream",
-- },
-- },
-- }
