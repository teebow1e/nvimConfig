local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "bash",
    "cmake",
    "cpp",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",
    "gitcommit",
    "go",
    "json",
    "latex",
    "perl",
    "php",
    "python",
    "regex",
    "requirements",
    "ruby",
    "rust",
    "solidity",
    "sql",
    "ssh_config",
    "tsx",
    "xml",
    "yaml",
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.presence = {
  auto_update = true,
  neovim_image_text = "Help! Can't exit this wonderful editor :(",
  main_image = "file",
  log_level = nil,
  debounce_timeout = 10,
  enable_line_number = false,
  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
    "man",
    "prompt",
  },
  buttons = {{ label = "just click don't ask", url = "https://www.youtube.com/watch?v=C3GouGa0noM" }},
  show_time = true,
  editing_text = "making spaghetti in %s",
  file_explorer_text = "searching %s",
  git_commit_text = "ready to screw up the main branch",
  plugin_manager_text = "taking care of this masterpiece",
  reading_text = "reading? %s",
  workspace_text = "working on %s",
  line_number_text = "at line %s out of %s",
}

M.noice = {
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },

  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
  },

  cmdline = {
    format = {
      search_down = { view = "cmdline" },
      search_up = { view = "cmdline" },
    },
  },

  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = { enabled = false },
    hover = { enabled = false },
  },

  views = {
    cmdline_popup = {
      position = { row = 5, col = "50%" },
      size = { width = 60, height = "auto" },
    },
    popupmenu = {
      relative = "editor",
      position = { row = 8, col = "50%" },
      size = { width = 60, height = 10 },
      border = { style = "rounded", padding = { 0, 1 } },
      win_options = {
        winhighlight = {
          Normal = "Normal",
          FLoatBorder = "DiagnosticInfo",
        },
      },
    },
  },
}

M.lspsaga = {
  code_action = {
    show_server_name = false,
    num_shortcut = false,
  },
  request_timeout = 2000,
  lightbulb = {
    enable = false,
    virtual_text = false,
  },
  diagnostic = {
    show_code_action = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    title = true,
    expand = "",
    collapse = "",
    code_action = "",
  },
  finder = {
    max_height = 0.6,
    left_width = 0.35,
    right_width = 0.55,
    layout = "float",
  },
}

M.todocomments = {
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = {
        "FIXME",
        "BUG",
        "FIXIT",
        "ISSUE",
      },
    },
    TODO = { icon = "󰔟 ", color = "todo" },
    HACK = { icon = "󱗗 ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "󱢍 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "󱞁 ", color = "info", alt = { "INFO" } },
    TEST = {
      icon = "󰙨 ",
      color = "test",
      alt = {
        "TESTING",
        "PASSED",
        "FAILED",
      },
    },
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#ff6c6b" },
    warning = { "DiagnosticWarn", "WarningMsg", "#ECBE7B" },
    todo = { "DiagnosticOk", "#66c4ff" },
    info = { "DiagnosticInfo", "#98be65" },
    default = { "Identifier", "#dc8ef3" },
    test = { "Identifier", "#ff75a0" },
  },
}

M.zen = {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    options = {
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
    wezterm = {
      enabled = false,
      font = "+4", -- (10% increase per step)
    },
  },
}

-- TODO: Zenmode configuration
-- TODO: Convert config to separate file

M.trouble = {
  padding = false,
}

return M
