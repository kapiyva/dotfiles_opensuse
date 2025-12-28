require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "cspell",
    "eslint-lsp",
    "lua-language-server",
    "prettier",
    "prettierd",
    "rust-analyzer",
    "stylua",
    "tailwindcss-language-server",
    -- typescript-language-server is not needed as we use typescript-tools.nvim
  },
  auto_update = true,
  run_on_start = true,
  integrations = {
    ["mason-lspconfig"] = true,
  },
})
