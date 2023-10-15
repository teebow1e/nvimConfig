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