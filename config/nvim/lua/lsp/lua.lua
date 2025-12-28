local common = require("lsp.common")

-- Configure Lua language server using new vim.lsp.config API
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Neovimのランタイムファイルを読み込む
				library = vim.api.nvim_get_runtime_file("", true),
				-- サードパーティのライブラリチェックを無効化（パフォーマンス向上）
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = common.create_on_attach(),
	capabilities = common.default_capabilities(),
})
