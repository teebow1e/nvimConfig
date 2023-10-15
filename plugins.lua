local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      -- require("neodev").setup({})
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "plugins.configs.telescope"
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      table.insert(conf.extensions_list, "file_browser")
      table.insert(conf.extensions_list, "project")
      conf.extensions.file_browser = {
        hijack_netrw = true,
        hidden = { file_browser = true, folder_browser = true },
      }
      return conf
    end,
    dependencies = { "nvim-telescope/telescope-file-browser.nvim", "nvim-telescope/telescope-project.nvim" },
  },

  -- Install a plugin
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("zen-mode").setup(overrides.zen)
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "python", "javascript" },
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup(overrides.presence)
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufEnter",
    config = function()
      require("scrollEOF").setup {
        pattern = "*",
        insert_mode = true,
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {},
    config = function()
      require("noice").setup(overrides.noice)
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup(overrides.lspsaga)
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufWinEnter",
    config = function()
      local rd = require "rainbow-delimiters"
      require "rainbow-delimiters.setup" {
        strategy = {
          [""] = rd.strategy["global"],
          vim = rd.strategy["local"],
        },
        query = {
          [""] = "raindow-delimiters",
          lua = "rainbow-blocks",
        },
        highlights = {
          "RainbowDelmitersRed",
          "RainbowDelmitersYellow",
          "RainbowDelmitersBlue",
          "RainbowDelmitersOrange",
          "RainbowDelmitersGreen",
          "RainbowDelmitersViolet",
          "RainbowDelmitersCyan",
        },
        -- blacklist = { "c", "cpp" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup(overrides.todocomments)
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup(overrides.trouble)
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    -- dependencies = { "kkharji/sqlite.lua" },
    event = "BufEnter",
    config = function()
      require("neoclip").setup()
    end,
  },
  { "folke/neodev.nvim",
    opts = {}
  },
}
-- INFO: Maybe we can use conform.nvim

return plugins
