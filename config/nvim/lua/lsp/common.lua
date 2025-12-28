-- Common LSP configuration settings
local M = {}

-- Default format function
M.default_format = function()
	vim.lsp.buf.format({ async = false })
end

-- Create default on_attach function with optional custom format
M.create_on_attach = function(custom_format)
	local format = custom_format or M.default_format

	return function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- Key mappings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
		vim.keymap.set("n", "gj", "<CMD>lua vim.diagnostic.goto_next()<CR>")
		vim.keymap.set("n", "gk", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Format on save
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("LspFormatting" .. bufnr, { clear = true }),
				buffer = bufnr,
				callback = function(args)
					format(args)
				end,
			})
		end
	end
end

-- Default capabilities with nvim-cmp
M.default_capabilities = function()
	local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if has_cmp then
		return cmp_nvim_lsp.default_capabilities()
	end
	return vim.lsp.protocol.make_client_capabilities()
end

-- Helper to merge configurations
M.merge_config = function(base_config, custom_config)
	return vim.tbl_deep_extend("force", base_config, custom_config or {})
end

return M