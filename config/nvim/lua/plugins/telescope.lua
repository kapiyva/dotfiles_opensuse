require("telescope").load_extension("media_files")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "venv", ".git" },
		-- path_display = {'shorten'},
	},
	pickers = {
		find_files = { hidden = true },
	},
	extentions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg",
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>fa", ":Telescope<cr>", {})
vim.keymap.set("n", "<space>ff", builtin.find_files, {})
vim.keymap.set("n", "<space>fg", builtin.live_grep, {})
vim.keymap.set("n", "<space>fk", builtin.keymaps, {})
vim.keymap.set("n", "<space>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<space>gs", builtin.git_status, {})
vim.keymap.set("n", "<space>gb", builtin.git_branches, {})
vim.keymap.set("n", "<space>fm", ":Telescope media_files<cr>", {})
