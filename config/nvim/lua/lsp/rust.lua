local common = require("lsp.common")

-- Configure Rust Analyzer using new vim.lsp.config API
vim.lsp.config("rust_analyzer", {
	cmd = { "/home/kapiyva/.cargo/bin/rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "Cargo.lock", "rust-project.json", ".git" },
	settings = {
		["rust_analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
	on_attach = common.create_on_attach(),
	capabilities = common.default_capabilities(),
})

vim.g.rustfmt_autosave = 1
