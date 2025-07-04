vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
		end,
	},
})

-- LSPサーバーのセットアップ関数をエクスポート
local M = {}

M.default_format = function()
	vim.lsp.buf.format({ async = false })
end

-- 共通のon_attach関数を定義
M.default_on_attach_factory = function(config_format)
	local format = config_format or M.default_format

	return function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- key mapping
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
		vim.keymap.set("n", "gj", "<CMD>lua vim.diagnostic.goto_next()<CR>")
		vim.keymap.set("n", "gk", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- format on save
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
				buffer = bufnr,
				callback = function(args)
					format(args)
				end,
			})
		end
	end
end

-- 共通のcapabilitiesを設定
M.default_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
M.setup = function(server_name, config)
	config = config or {}
	config.on_attach = config.on_attach or M.default_on_attach_factory(config.format)
	config.capabilities = config.capabilities or M.default_capabilities
	lspconfig[server_name].setup(config)
end

return M
