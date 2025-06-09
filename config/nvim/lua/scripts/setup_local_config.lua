-- setup_nvim_local.lua
-- プロジェクトルートで実行してください (e.g. :luafile setup_nvim_local.lua)

local uv = vim.loop

-- .nvim/ ディレクトリ作成
local config_dir = uv.cwd() .. "/.nvim"
if vim.fn.isdirectory(config_dir) == 0 then
  uv.fs_mkdir(config_dir, 493) -- 0755
else
  print("⚠️ .nvim ディレクトリがすでに存在します。中止しました。")
  return
end

-- init.lua の内容
local init_lua = [[
-- .nvim/init.lua

local root = debug.getinfo(1, "S").source:match("@?(.*/)")
local function load_config(name)
  local path = root .. name .. ".lua"
  if vim.fn.filereadable(path) == 1 then
    dofile(path)
  end
end

-- load_config("lsp")
]]

-- lsp.lua の内容
local lsp = [[
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if client.name == "tsserver" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          local params = {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }
          vim.lsp.buf.execute_command(params)
        end,
      })
    end
  end,
})
]]

local function write_file(path, content)
  local fd = assert(uv.fs_open(path, "w", 420)) -- 0644
  assert(uv.fs_write(fd, content, -1))
  uv.fs_close(fd)
end

-- ファイル作成
write_file(config_dir .. "/init.lua", init_lua)
write_file(config_dir .. "/lsp.lua", lsp)

print("✅ .nvim/ 以下にローカル Neovim 設定を作成しました！")

