return {
  -- lsp管理
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "UIEnter",
    config = function ()
      -- extentions
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-tsserver',
        'coc-eslint',
        'coc-prettier',
        'coc-rust-analyzer',
        'coc-lua',
      }
      --config
      require("pconf.coc")
    end,
  },

  -- ファジーファインダー
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = { "<leader>f" },
    config = function()
      require("pconf.telescope")
    end,
  },
  { "fannheyward/telescope-coc.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },

  -- ファイルツリー
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },

  -- ファイルエクスプローラー
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { "<leader>e" },
    config = function ()
      require("pconf.nvim-tree")
    end,
  },

  -- theme
  -- {
  --   "folke/tokyonight.nvim",
  --   config = function ()
  --     require("pconf.tokyonight")
  --   end,
  -- },

  {
    "neanias/everforest-nvim",
    config = function ()
      require("pconf.everforest")
    end,
  },

  -- ステータスバー装飾
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    config = function ()
      require("pconf.lualine")
    end,
  },

  -- スクロールバー関連
  {
    "petertriho/nvim-scrollbar",
    config = function ()
      require("pconf.scrollbar")
    end,
  },

  -- Git関連
  {
    "lewis6991/gitsigns.nvim",
    event = "UIEnter",
    config = function ()
      require("pconf.gitsigns")
    end,
  },

  -- rust setup
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },

  -- カーソルジャンプ
  { 
    "phaazon/hop.nvim",
    event = "UIEnter",
    config = function()
      require("pconf.hop")
    end
  },

  -- add/delete/change surrounding pairs
  {
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({})
    end
  },
  -- copilot
  {
    "github/copilot.vim",
    event = "BufEnter",
    config = function()
      require("pconf.copilot")
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

  { "LunarWatcher/auto-pairs" },
}

