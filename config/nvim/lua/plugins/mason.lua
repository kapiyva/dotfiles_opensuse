require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "cspell",
    "eslint-lsp",
    "lua-language-server",
    "prettier",
    "rust-analyzer",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server",
  },
  auto_update = true,
  run_on_start = true,
  integrations = {
    ["mason-lspconfig"] = true,
  },
})
