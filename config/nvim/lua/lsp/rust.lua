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
        features = {
          "ssr",
          "hydrate",
          "infra",
        },
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
      },
      procMacro = {
        enable = true,
        ignore = {
          leptos_macro = {
            "server",
          },
        },
      },
    },
  },
})

vim.g.rustfmt_autosave = 1
