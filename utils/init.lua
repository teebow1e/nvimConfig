local M = {}

function M.popup_display()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
  })

  popup:mount()
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })
end

function M.compile(command, open_quickfix)
  local lines = { '' }

  local function on_event(job_id, data, event)
    if event == 'stdout' or event == 'stderr' then
      if data then
        vim.list_extend(lines, data)
      end
    end

    if event == 'exit' then
      local non_empty_lines = (vim.tbl_filter(function(line)
        return #line > 0
      end, lines))

      if #non_empty_lines > 0 then
        vim.fn.setqflist({}, ' ', {
          title = command,
          lines = lines,
        })
        vim.api.nvim_command 'doautocmd QuickFixCmdPost'
        if open_quickfix then
          -- vim.cmd.copen()
          require("trouble").open("quickfix")
          vim.cmd.wincmd 'p'
        end
      else
        require("notify")("Compilation completed without any output.", "info")
      end
      require("nvterm.terminal").new "vertical"
    end
  end

  local job_id = vim.fn.jobstart(command, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

return M
