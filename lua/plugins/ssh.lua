return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to GitHub releases
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = function()
    local function launch_neovide_detached(port)
      local address = ("localhost:%s"):format(port)
      local job_id = vim.fn.jobstart({ "neovide", "--server", address }, {
        detach = true,
      })

      if job_id <= 0 then
        vim.notify(("Failed to launch Neovide for %s"):format(address), vim.log.levels.ERROR)
      end
    end

    require("remote-nvim").setup({
      remote = {
        copy_dirs = {
          config = {
            base = vim.fn.stdpath("config"),
            -- Avoid copying dotfile metadata from the dotfiles repo such as `.codex` and `.git`.
            dirs = { "init.lua", "lua", "lazy-lock.json", "lazyvim.json", "stylua.toml" },
            compression = {
              enabled = true,
              additional_opts = { "--exclude-vcs" },
            },
          },
        },
      },
      client_callback = function(port, _)
        if vim.env.REMOTE_NVIM_NEOVIDE_DETACH == "1" then
          launch_neovide_detached(port)
          return
        end

        require("remote-nvim.ui").float_term(("nvim --server localhost:%s --remote-ui"):format(port), function(exit_code)
          if exit_code ~= 0 then
            vim.notify(("Local client failed with exit code %s"):format(exit_code), vim.log.levels.ERROR)
          end
        end)
      end,
    })

    require("config.remote_neovide").setup()
  end,
}
