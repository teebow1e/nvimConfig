require("lspsaga").setup{
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