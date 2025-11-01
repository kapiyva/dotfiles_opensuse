local lsp = require("plugins.lspconfig")
local conform = require("conform")

lsp.setup("ts_ls", {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative",
    },
  },
  format = function(args)
    -- Organize imports before formatting
    vim.lsp.buf.code_action({
      context = {
        only = { "source.organizeImports.ts" },
        diagnostics = {},
      },
      apply = true,
    })
    vim.wait(100) -- Wait for organize imports to complete
    
    conform.format({
      bufnr = args.bufnr,
      timeout_ms = 1000,
    })
    lsp.default_format()
  end,
})
