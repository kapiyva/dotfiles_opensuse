require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

vim.keymap.set("n", "gw", ":HopWord<CR>")
vim.keymap.set("n", "gl", ":HopLine<CR>")
