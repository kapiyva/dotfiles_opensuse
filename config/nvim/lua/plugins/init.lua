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
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable",
    -- Necessary for `default_explorer` to work properly
    lazy = false,
    opts = {},
    keys = {
      { "<space>e", "<cmd>Fyler kind=float<cr>", desc = "Open fyler in floating window" },
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

  -- copilot
  { "github/copilot.vim" },

  -- ai terminal
  {
    "folke/sidekick.nvim",
    opts = {
      -- -- add any options here
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
})
