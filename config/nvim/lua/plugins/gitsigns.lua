require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "g>", function()
			if vim.wo.diff then
				return "g>"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "g<", function()
			if vim.wo.diff then
				return "g<"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>gsh", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>grh", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>gsb", gs.stage_buffer)
		map("n", "<leader>guh", gs.undo_stage_hunk)
		map("n", "<leader>gub", gs.reset_buffer)
		map("n", "<leader>gph", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

require("scrollbar.handlers.gitsigns").setup()
