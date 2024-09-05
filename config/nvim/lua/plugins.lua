return {
  -- coc.nvim
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "UIEnter",
    config = function()
      -- extentions
      vim.g.coc_global_extensions = {
        'coc-eslint',
        'coc-json',
        'coc-lua',
        'coc-prettier',
        'coc-rust-analyzer',
        'coc-toml',
        'coc-tsserver',
        '@yaegassy/coc-tailwindcss3',
      }
      --config
      require("pconf.coc")
    end,
  },

  -- fazzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>f" },
    config = function()
      require("pconf.telescope")
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
      require("pconf.treesitter")
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { "<leader>e" },
    config = function()
      require("pconf.nvim-tree")
    end,
  },

  -- color scheme
  {
    "neanias/everforest-nvim",
    config = function()
      require("pconf.everforest")
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    config = function()
      require("pconf.lualine")
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("pconf.scrollbar")
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "UIEnter",
    config = function()
      require("pconf.gitsigns")
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
