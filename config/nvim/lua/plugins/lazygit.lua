-- lazygit終了後にgit worktreeのrootディレクトリに移動する
vim.api.nvim_create_autocmd("TermClose", {
	pattern = "*lazygit*",
	callback = function()
		-- lazygit終了後、git rootディレクトリを取得
		local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null")
		if vim.v.shell_error == 0 then
			git_root = vim.trim(git_root)
			-- ディレクトリが存在し、現在のpwdと異なる場合のみ変更
			if vim.fn.isdirectory(git_root) == 1 and vim.fn.getcwd() ~= git_root then
				vim.cmd("cd " .. vim.fn.fnameescape(git_root))
				print("Changed directory to: " .. git_root)
			end
		end
	end,
})
