return {
  { "tpope/vim-fugitive" },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- 기본 키맵 활성화
        disable_diagnostics = true, -- 충돌 중 진단 비활성화
        highlights = { -- 충돌 상태를 강조 표시
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these는 하나만 필요합니다.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
}
