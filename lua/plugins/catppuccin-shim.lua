-- lua/plugins/catppuccin-shim.lua
return {
  {
    "catppuccin/nvim",
    -- LazyVim이 bufferline 하이라이트를 계산하기 전에 이 모듈이 로드되게 함
    lazy = false,
    priority = 1001, -- catppuccin(보통 1000)보다 살짝 앞서거나 같게
    config = function()
      -- catppuccin 로드 후 bufferline 통합 모듈을 불러서 어댑터 주입
      local ok, mod = pcall(require, "catppuccin.groups.integrations.bufferline")
      if ok and mod and not mod.get and mod.get_theme then
        mod.get = mod.get_theme
      end
    end,
  },
}
