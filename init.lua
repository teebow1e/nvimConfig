local opt = vim.opt
local g = vim.g
local utils = require("custom.utils")

-- Change default cursor to block even in Insert mode
opt.guicursor = "n-v-c-i:block"

-- Set virtual column
-- opt.cc = "+1,90"

-- Enable relative line number by default
opt.relativenumber = true

-- Autocmd
local autocmd = vim.api.nvim_create_autocmd
autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      hlgroup = "Search",
      timeout = 150,
      on_visual = true,
    }
  end,
})

autocmd("FileType", {
  callback = function()
    if vim.bo.ft == "nvdash" then
      vim.opt.laststatus=0
    else
      vim.opt.laststatus=3
    end
  end
})

-- User defined commands
local create_command = vim.api.nvim_create_user_command

create_command("Cppcompile", function()
  local compiler = ""
  local output_file = ""
  local current_path = vim.api.nvim_buf_get_name(0)
  local folder_path = vim.fn.getcwd()
  vim.ui.input({
    prompt = "Enter file name for output file: ",
    default = "output"
  }, function (input)
    output_file = input
  end)
  local output_path = folder_path .. "/" .. output_file
  if vim.fn.executable('g++') == 1 then
    compiler = "g++"
  else
    vim.api.nvim_err_writeln('no compiler found')
    return
  end
  local flag = "-Wall -Wextra"
  local final_command = compiler .. " " ..  current_path .. " " .. '-o' .. " " ..  output_path .. " " .. flag

  utils.compile(final_command, true)
end,{})
