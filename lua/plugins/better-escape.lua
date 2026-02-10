return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      -- timeout = vim.o.timeoutlen, -- 입력 지연 시간 설정 (기본 Neovim 설정값 사용)
      timeout = 10,
      default_mappings = true,
      mappings = {
        i = {
          j = {
            k = "<Esc>", -- 'jk'를 ESC로 매핑
          },
        },
      },
    })
  end,
}
