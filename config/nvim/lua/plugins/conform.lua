require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    rust = { "leptosfmt", "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  },
  formatters = {
    prettier = {
      condition = function()
        return vim.loop.fs_realpath(".prettierrc.js") ~= nil or vim.loop.fs_realpath(".prettierrc.mjs") ~= nil
      end,
      -- Use prettierd (note: different spelling) if available for better performance
      command = function()
        if vim.fn.executable("prettierd") == 1 then
          return "prettierd"
        end
        return "prettier"
      end,
      -- Use stdin to avoid file I/O overhead
      stdin = true,
    },
    leptosfmt = {
      command = "leptosfmt",
      args = { "$FILENAME" },
      stdin = false,
    },
  },
})
