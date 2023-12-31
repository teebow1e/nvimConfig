local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
  },

  statusline = {
    theme = "vscode_colored",
  },
  cmp = {
    icons = true,
    style = "flat_dark",
    lspkind_text = true,
    selected_item_bg = "colored",
  },
  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, #modules)
    end,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
