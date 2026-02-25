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
    end,
  },
  -- lsp server manager
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("plugins.mason")
    end,
  },
  -- typescript lsp extras
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- linter
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("plugins.nvim-lint")
    end,
  },
  -- formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("plugins.conform")
    end,
  },
  -- remove whitespace
  {
    "cappyzawa/trim.nvim",
    opts = {},
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
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    opts = {},
  },

  -- code outline window
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
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
  -- git
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<space>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      require("plugins.lazygit")
    end,
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

  -- filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.neo-tree")
    end,
    keys = {
      { "<space>e", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" },
    },
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
    end,
  },

  -- add/delete/change surrounding pairs
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- comment out
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.comment")
    end,
  },

  -- indent line
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.hlchunk")
    end,
  },

  -- window resize
  {
    "0xm4n/resize.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.resize")
    end,
  },

  -- preview
  { "kevinhwang91/nvim-bqf" },

  -- folding
  {
    "kevinhwang91/nvim-ufo",
    event = "UIEnter",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("plugins.ufo")
    end,
  },

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

  -- display lsp loading state
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },

  -- zen-mode
  {
    "folke/zen-mode.nvim",
    event = "UIEnter",
    config = function()
      require("plugins.zen-mode")
    end,
  },

  -- -- copilot
  -- { "github/copilot.vim" },
  --
  -- ai terminal
  {
    "folke/sidekick.nvim",
    opts = function()
      return require("plugins.sidekick").opts
    end,
    keys = function()
      return require("plugins.sidekick").keys
    end,
  },
})
