require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "cspell",
    "rust-analyzer",
    "typescript-language-server",
    "eslint-lsp",
    "prettier",
    "lua-language-server",
    "stylua",
    "tailwindcss-language-server",
  },
  auto_update = true,
  run_on_start = true,
  integrations = {
    ["mason-lspconfig"] = true,
  },
})
