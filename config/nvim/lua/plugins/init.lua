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
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lspconfig")
    end
  },
  -- lsp server manager
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.mason")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("plugins.nvim-lint")
    end,
  },
  -- autocomplete
  {
    "hrsh7th/cmp-vsnip",
    event = "InsertEnter",
  },
  {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "InsertEnter",
  },
  { 
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.nvim-cmp")
    end,
  },

  -- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },

  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("plugins.none-ls")
    end,
  },

  -- prettier
  {
    'prettier/vim-prettier',
    config = function()
      require("plugins.prettier")
    end,
  },

  -- code outline window
  {
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("plugins.aerial")
    end,
  },

  -- fazzy finder
  {
    "nvim-telescope/telescope.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<space>" },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-lua/popup.nvim" },
  },

  -- highlight
  {
    "nvim-treesitter/nvim-treesitter",
    event = "UIEnter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- display context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require("plugins.nvim-treesitter-context")
    end,
  },

  -- file explorer
  {
    'stevearc/oil.nvim',
    keys = { "<space>" },
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("plugins.oil")
    end,
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

  -- auto pairing brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ map_cr = false })
    end,
  },

  -- word jump
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.hop")
    end
  },

  -- add/delete/change surrounding pairs
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- comment out
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.comment")
    end
  },

  -- indent line
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.hlchunk")
    end,
  },

  -- preview
  { "kevinhwang91/nvim-bqf" },

  -- buffer as tab and tab util
  {
    "romgrk/barbar.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.barbar")
    end,
    version = "^1.0.0",
  },

  -- copilot
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    config = function()
      require("plugins.copilot-chat")
    end,
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

  -- zen-mode
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.zen-mode")
    end,
  },
})
