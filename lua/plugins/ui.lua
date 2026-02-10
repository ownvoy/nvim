return {
  -- Trouble 설정 (진단 목록 창)
  {
  "folke/noice.nvim",
  opts = {
    -- 1. LSP settings
    lsp = {
      signature = {
        enabled = false, -- 그 커다란 설명창 비활성화
      },
    },
    -- 2. Notify settings (Moved from 'config' to here)
    notify = {
      enabled = false,
    },
  },
  -- 'config' key is removed entirely so lazy.nvim handles the setup automatically
  },
  
  -- Symbols Outline (코드 구조 보기)
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- Telescope 설정 (파일 찾기 등)
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- 플러그인 파일 검색 키맵 추가
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Telescope FZF Native (검색 속도 향상)
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
