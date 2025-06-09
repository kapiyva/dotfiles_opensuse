local lsp = require("plugins.lspconfig")

lsp.setup("rust_analyzer", {
	settings = {
		["rust_analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = { allFeatures = true },
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

vim.g.rustfmt_autosave = 1
