local overrides = require("custom.plugins.configs.overrides")
return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("custom.plugins.configs.tools.zen-mode")
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
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
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
}
