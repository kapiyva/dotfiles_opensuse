local lsp = require("plugins.lspconfig")

lsp.setup('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})
