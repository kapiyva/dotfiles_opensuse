local null_ls = require "null-ls"
local diagnostics = require "null-ls.diagnostics"

null_ls.setup {
  sources = {
    diagnostics.eslint,
    null_ls.builtins.formatting.prettier.with {
      prefer_local = "node_modules/.bin",
    },
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,

    null_ls.builtins.diagnostics.codespell.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity["WARN"]
      end,
    })
  },
}
