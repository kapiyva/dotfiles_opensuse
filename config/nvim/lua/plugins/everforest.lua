require("everforest").setup({
	background = "hard",
	transparent_background_level = 2,
})

vim.cmd([[colorscheme everforest]])

-- 背景を完全に透過
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
