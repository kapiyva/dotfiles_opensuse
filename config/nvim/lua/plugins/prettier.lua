vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.json",
		"*.yaml",
		"*.yml",
		"*.html",
		"*.css",
		"*.scss",
		"*.less",
		"*.md",
		"*.lua",
	}, -- フォーマット対象のファイルタイプを指定
	callback = function()
		-- vim.lsp.buf.format { async = false } -- LSPフォーマットを実行（prettierが登録されていればprettierが実行される）
		-- または、prettier単体で実行する場合（下記コメントアウトを有効にする）
		vim.cmd([[Prettier]])
	end,
})
