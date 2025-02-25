local lsp = require("plugins.lspconfig")

lsp.setup('rust_analyzer', {
  settings = {
    ['rust_analyzer'] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

vim.g.rustfmt_autosave = 1
