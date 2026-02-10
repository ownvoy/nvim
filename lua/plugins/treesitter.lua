return {
  -- Treesitter 파서 추가
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- ✅ KEY FIX: Forces use of the latest git commit (master branch)
    build = ":TSUpdate", -- ✅ Ensure parsers update when the plugin updates
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "tsx",
          "typescript",
          "bash",
          "html",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "vim",
          "yaml",
        })
      end
    end,
  },
}
