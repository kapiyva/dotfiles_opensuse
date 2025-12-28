-- Configure diagnostics
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
})

-- Load individual LSP configurations
require("lsp.rust")
require("lsp.typescript")
require("lsp.lua")
require("lsp.tailwindcss")

-- Enable all configured language servers
vim.lsp.enable("rust_analyzer")
-- typescript-tools is enabled via its own setup function in typescript.lua
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")
