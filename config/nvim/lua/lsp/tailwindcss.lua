local common = require("lsp.common")

-- Configure Tailwind CSS language server using new vim.lsp.config API
vim.lsp.config("tailwindcss", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"css",
		"scss",
		"sass",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", "postcss.config.js", "postcss.config.cjs", "postcss.config.mjs", "postcss.config.ts", "package.json", "node_modules", ".git" },
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "classList", "ngClass" },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning"
			},
			validate = true
		}
	},
	on_attach = common.create_on_attach(),
	capabilities = common.default_capabilities(),
})