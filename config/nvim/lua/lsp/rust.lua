local lsp = require("plugins.lspconfig")

lsp.setup("rust_analyzer", {
  cmd = { "/home/kapiyva/.cargo/bin/rust-analyzer" },
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

vim.g.rustfmt_autosave = 1
