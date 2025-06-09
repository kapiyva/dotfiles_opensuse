local lsp = require("plugins.lspconfig")
local conform = require("plugins.conform")

lsp.setup("lua_ls", {
	format = function(args)
		vim.lsp.buf.format({ async = false })
		conform.format({
			bufnr = args.bufnr,
			timeout_ms = 1000,
		})
	end,
})
