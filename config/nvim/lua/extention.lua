return {
  -- coc.nvim
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "UIEnter",
    config = function()
      -- extentions
      vim.g.coc_global_extensions = {
        'coc-spell-checker',
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
      require("extentions.coc")
    end,
  },

  -- fazzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>f" },
    config = function()
      require("extentions.telescope")
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
      require("extentions.treesitter")
    end,
  },

  -- display context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      require("extentions.nvim-treesitter-context")
    end,
  },
  -- file explorer
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   keys = { "<leader>e" },
  --   config = function()
  --     require("extentions.nvim-tree")
  --   end,
  -- },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    config = function()
      require("extentions.oil")
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
      require("extentions.everforest")
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    config = function()
      require("extentions.lualine")
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("extentions.scrollbar")
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
      require("extentions.hop")
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
      require('extentions.barbar')
    end,
    version = '^1.0.0',
  },

  -- display command
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("extentions.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
}
