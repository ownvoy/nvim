return {
  -- 1. LSP 서버 설정
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = "none",
                },
              },
            },
          },
        },

        ruff = {
          init_options = {
            settings = {
              lint = {
                select = { "E", "F", "B" },
                ignore = { "F821" },
              },
            },
          },
        },
        clangd = {
          cmd = { "clangd", "--background-index", "--clang-tidy" },
        },
      },
    },
  },

  -- 2. 도구 자동 설치 (Mason)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
        "ruff",
        "black",
        "clangd",
        "clang-format",
      })
    end,
  },

  -- 3. 포매팅 설정 (conform.nvim)
  {
    "stevearc/conform.nvim",
    opts = {
      -- [1] 나만의 포매터 정의 (충돌 방지를 위해 이름 변경)
      formatters = {
        my_ruff_organizer = {
          command = "ruff",
          -- args를 직접 정의하여 중복 옵션을 원천 차단합니다.
          -- check: 검사하라
          -- --select I,F401: Import 정렬(I)과 미사용 변수(F401)만 골라서
          -- --fix: 고쳐라
          -- - : 표준 입력(stdin)에서 읽어라
          args = { "check", "--select", "I,F401", "--fix", "--stdin-filename", "$FILENAME", "-" },
        },
      },
      -- [2] 파일 타입별 적용
      formatters_by_ft = {
        -- 위에서 만든 my_ruff_organizer를 먼저 실행하고, 그 뒤에 black 실행
        python = { "my_ruff_organizer", "black" },
        cpp = { "clang-format" },
      },
    },
  },
  -- 4. 구형 플러그인 비활성화
  { "mhartington/formatter.nvim", enabled = false },
}
