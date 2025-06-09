local lsp = require("plugins.lspconfig")
local conform = require("conform")

lsp.setup("ts_ls", {
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	format = function(args)
		vim.lsp.buf.execute_command({
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		})
		conform.format({
			bufnr = args.bufnr,
			timeout_ms = 1000,
		})
		lsp.default_format()
	end,
})
