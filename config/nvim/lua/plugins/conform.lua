require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "leptosfmt", "rustfmt" },
    javascript = { "prettier", "rustywind" },
    typescript = { "prettier", "rustywind" },
    javascriptreact = { "prettier", "rustywind" },
    typescriptreact = { "prettier", "rustywind" },
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
    leptosfmt = {
      command = "leptosfmt",
      args = { "$FILENAME" },
      stdin = false,
    },
  },
})
