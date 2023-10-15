--   @type MappingsTable
--   Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   term_mode = "t"
--   visual_mode = "v"

local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>x"] = "",
  },
}

M.general = {
  n = {
    ["<Esc>"] = { ":noh <CR>", "Clear highlights", opts = { silent = true } },

    -- Better vertical navigation
    ["<C-d>"] = { "<C-d>zz", "Move down half screen" },
    ["<C-u>"] = { "<C-u>zz", "Move up half screen" },

    -- Resize panes
    ["<C-Up>"] = { ":resize -2<CR>", "Decrease window height", opts = { silent = true } },
    ["<C-Down>"] = { ":resize +2<CR>", "Increase window height", opts = { silent = true } },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Decrease window width", opts = { silent = true } },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Increase window width", opts = { silent = true } },

    -- Closing panes
    ["<A-x>"] = { "<C-w>c", "Close a pane" },

    -- Line manipulation
    ["<A-j>"] = { "<cmd> m+1<CR>==", "Move line down", opts = { silent = true } },
    ["<A-k>"] = { "<cmd> m-2<CR>==", "Move line up", opts = { silent = true } },

    -- Better searching experience
    ["n"] = { "nzz", opts = { silent = true } },
    ["N"] = { "Nzz", opts = { silent = true } },


    ["<C-a>"] = { "ggVG", "Select all", opts = { silent = true } },
  },
  v = {
    ["<"] = { "<gv", "indent left" },
    [">"] = { ">gv", "indent right" },
  },
}

M.tabufline = {
  plugin = true,
  n = {
    ["<leader>q"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fb"] = {
      "<cmd>Telescope file_browser<CR>",
      "File browser",
    },
    ["<C-p>"] = {
      ":lua require'telescope'.extensions.project.project{}<CR>",
      "Workspaces",
      opts = {
        silent = true,
      },
    },
  },
}
return M
