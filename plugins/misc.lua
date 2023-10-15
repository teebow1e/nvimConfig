return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("custom.plugins.configs.misc.presence")
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {}
  },
}
