-- color theme, global key config, and others
require("options")

-- plugins
require("plugins")

-- lsp
require("lsp")

-- keyconfig
require("keyconfig")

-- load project config
local function load_project_config()
  local cwd = vim.fn.getcwd()
  local local_config = cwd .. "/.nvim/init.lua"

  if vim.fn.filereadable(local_config) == 1 then
    -- 安全性のため、プロジェクトルートが信頼できるかチェック
    if vim.fn.isdirectory(cwd .. "/.git") == 1 then
      -- プロジェクトルートの.nvim/init.luaを読み込み
      dofile(local_config)
      print("Loaded project local config: " .. local_config)
    else
      print("Project config found but not in git repository, skipping for security")
    end
  end
end

load_project_config()

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = load_project_config,
})
