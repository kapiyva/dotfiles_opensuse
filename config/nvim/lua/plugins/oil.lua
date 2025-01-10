require("oil").setup({
  keymap = {
    ["c-v"] = { "actions.select", opts = { vertical = true } },
    ["c-x"] = { "actions.select", opts = { holizontal = true } },
  }
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
