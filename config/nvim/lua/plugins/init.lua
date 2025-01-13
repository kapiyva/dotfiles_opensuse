local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- coc.nvim
  --{
  --  "neoclide/coc.nvim",
  --  branch = "release",
  --  event = "UIEnter",
  --  config = function()
  --    -- extentions
  --    vim.g.coc_global_extensions = {
  --      'coc-spell-checker',
  --      'coc-eslint',
  --      'coc-json',
  --      'coc-lua',
  --      'coc-prettier',
  --      -- 'coc-rust-analyzer',
  --      'coc-toml',
  --      'coc-tsserver',
  --      '@yaegassy/coc-tailwindcss3',
  --    }
  --    --config
  --    require("plugins.coc")
  --  end,
  --},

  -- lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lspconfig")
    end
  },
  -- lsp server manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason")
    end
  },
  { "williamboman/mason-lspconfig.nvim" },
  -- autocomplete
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer"},
  { "hrsh7th/cmp-path"},
  { "hrsh7th/cmp-cmdline"},
  { 
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.nvim-cmp")
    end
  },

  -- fazzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>f" },
    config = function()
      require("plugins.telescope")
    end,
  },
  { "fannheyward/telescope-coc.nvim" },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-lua/popup.nvim" },
  },

  -- highlight
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- display context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      require("plugins.nvim-treesitter-context")
    end,
  },
  -- file explorer
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   keys = { "<leader>e" },
  --   config = function()
  --     require("plugins.nvim-tree")
  --   end,
  -- },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    config = function()
      require("plugins.oil")
    end,
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
      "nvim-tree/nvim-web-devicons"
    }, -- use if prefer nvim-web-devicons
  },

  -- color scheme
  {
    "neanias/everforest-nvim",
    config = function()
      require("plugins.everforest")
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    config = function()
      require("plugins.lualine")
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("plugins.scrollbar")
    end,
  },

  -- auto pairing brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ map_cr = false })
    end,
  },

  -- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },

  -- word jump
  {
    "phaazon/hop.nvim",
    event = "UIEnter",
    config = function()
      require("plugins.hop")
    end
  },

  -- add/delete/change surrounding pairs
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- commentary
  {
    "tpope/vim-commentary",
    keys = { "v" },
  },

  -- window resize
  {
    "simeji/winresizer",
    event = "UIEnter",
  },

  -- indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('ibl').setup()
    end
  },

  -- buffer as tab and tab util
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.barbar')
    end,
    version = '^1.0.0',
  },

  -- display command
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
})
