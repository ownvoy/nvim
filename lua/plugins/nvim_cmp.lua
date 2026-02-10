return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- 문서창(Documentation)이 자동으로 뜨지 않게 설정
      opts.window = {
        documentation = cmp.config.window.bordered(),
      }

      -- 원한다면 문서창을 아예 끌 수도 있습니다 (주석 해제 시)
      opts.window.documentation = false

      -- 단축키로만 문서를 보고 싶다면 매핑을 확인하세요 (보통 <C-f>나 <C-d>로 스크롤/확인 가능)
    end,
  },
}
