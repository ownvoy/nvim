return {
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        filetype = {
          python = "$(which python) -u",
          cpp = {
            "cd $dir && clang++ -Wall -Wextra -g -o $fileNameWithoutExt $fileName && $dir/$fileNameWithoutExt",
          },
          cc = {
            -- adding .out
            "cd $dir && clang++ -Wall -Wextra -g -o $.out/fileNameWithoutExt $fileName && $dir/.out/$fileNameWithoutExt",
          },
        },
      })
      -- Keymaps for running and closing the runner
      vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
      vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
    end,
  },
}
