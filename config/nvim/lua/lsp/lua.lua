local lsp = require("plugins.lspconfig")

lsp.setup("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Neovimのランタイムファイルを読み込む
        library = vim.api.nvim_get_runtime_file("", true),
        -- サードパーティのライブラリチェックを無効化（パフォーマンス向上）
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
