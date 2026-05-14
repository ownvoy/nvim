local M = {}
local remote_server_launch_desc = "Launching Neovim server on the remote machine"

local function prepend_path(prefix)
  local path = vim.env.PATH or ""
  if path:find(prefix, 1, true) then
    return
  end
  vim.env.PATH = prefix .. ":" .. path
end

local function get_known_hosts()
  return vim.tbl_keys(require("remote-nvim").session_provider:get_config_provider():get_workspace_config())
end

local function notify_unknown_host(host_id)
  vim.notify(("Unknown host identifier: %s"):format(host_id), vim.log.levels.ERROR)
end

local function ensure_host_id(host_id)
  local trimmed = vim.trim(host_id or "")
  if trimmed == "" then
    error("Remote host identifier is required")
  end
  return trimmed
end

function M.start(host_id)
  host_id = ensure_host_id(host_id)

  local remote_nvim = require("remote-nvim")
  local config_provider = remote_nvim.session_provider:get_config_provider()
  local workspace_config = config_provider:get_workspace_config(host_id)

  if vim.tbl_isempty(workspace_config) then
    notify_unknown_host(host_id)
    return false
  end

  vim.env.REMOTE_NVIM_NEOVIDE_DETACH = "1"
  config_provider:update_workspace_config(host_id, {
    client_auto_start = true,
  })

  vim.cmd(("RemoteStart %s"):format(host_id))
  return true
end

function M.start_from_env()
  if not M.start(vim.env.REMOTE_NVIM_HOST or "") then
    vim.cmd("qaall!")
  end
end

function M.setup_env()
  if vim.env.REMOTE_NVIM_HOST ~= "H100_proxy" then
    return
  end

  prepend_path("/home/linuxbrew/.linuxbrew/bin")
  prepend_path("/home/linuxbrew/.linuxbrew/sbin")
end

function M.setup()
  M.setup_env()

  local provider = require("remote-nvim.providers.provider")
  if not provider._ownvoy_remote_neovide_patched then
    local run_command = provider.run_command
    provider.run_command = function(self, command, desc, extra_opts, exit_cb, on_local_executor)
      if desc == remote_server_launch_desc then
        command = ("REMOTE_NVIM_HOST=%s %s"):format(vim.fn.shellescape(self.unique_host_id), command)
      end
      return run_command(self, command, desc, extra_opts, exit_cb, on_local_executor)
    end
    provider._ownvoy_remote_neovide_patched = true
  end

  vim.api.nvim_create_user_command("RemoteNeovideStart", function(opts)
    M.start(opts.args)
  end, {
    nargs = 1,
    desc = "Start a remote-nvim session and open it in Neovide",
    complete = function(_, line)
      local args = vim.split(vim.trim(line), "%s+")
      table.remove(args, 1)
      local valid_hosts = get_known_hosts()
      if #args == 0 then
        return valid_hosts
      end
      return vim.fn.matchfuzzy(valid_hosts, args[1])
    end,
  })
end

return M
