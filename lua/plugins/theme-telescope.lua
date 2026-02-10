return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  lazy = true,
  dependencies = {
    "andrew-george/telescope-themes",
    -- your other dependencies
  },
  config = function()
    -- load extension
    local telescope = require("telescope")
    telescope.load_extension("themes")
  end,
}
