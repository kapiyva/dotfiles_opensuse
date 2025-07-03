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
        features = { "ssr", "hydrate" },
      },
      checkOnSave = {
        features = { "ssr", "hydrate" },
        command = "clippy",
      },
      procMacro = {
        enable = true,
        ignore = {
          leptos_macro = {
            "server",
            "component",
          },
        },
      },
    },
  },
})

vim.g.rustfmt_autosave = 1
