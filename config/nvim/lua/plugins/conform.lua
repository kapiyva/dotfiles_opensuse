require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    prettier = {
      condition = function()
        return vim.loop.fs_realpath(".prettierrc.js") ~= nil or vim.loop.fs_realpath(".prettierrc.mjs") ~= nil
      end,
    },
  },
})
