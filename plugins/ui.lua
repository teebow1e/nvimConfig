local overrides = require("custom.plugins.configs.overrides")
return {
  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufEnter",
    config = function()
      require("custom.plugins.configs.ui.scrolleof")
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
      require("custom.plugins.configs.ui.noice")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("custom.plugins.configs.ui.lspsaga")
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufWinEnter",
    config = function()
      require("custom.plugins.configs.ui.rainbow-delimeter")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.ui.todo-comments")
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("custom.plugins.configs.ui.trouble")
    end,
  },
}
