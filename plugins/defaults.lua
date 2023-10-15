local overrides = require("custom.plugins.configs.overrides")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.plugins.configs.defaults.null-ls"
        end,
      },
    },
    config = function()
      -- require("neodev").setup({})
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.defaults.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = require("custom.plugins.configs.defaults.treesitter")
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      require("custom.plugins.configs.defaults.telescope")
    end,
    dependencies = { "nvim-telescope/telescope-file-browser.nvim", "nvim-telescope/telescope-project.nvim" },
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
}
