return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    
    -- Create a wrapper function to filter notifications
    local filtered_notify = function(msg, ...)
      -- Skip unwanted messages
      if msg and (
        msg:match("null%-ls") or
        msg:match("none%-ls") or
        msg:match("failed to run generator") or
        msg:match("LSP") or
        msg:match("Format request failed") or
        msg:match("language servers")
      ) then
        return
      end
      -- Forward other notifications to notify
      notify(msg, ...)
    end

    notify.setup({
      position = "bottom_right",
      stages = "fade",
      timeout = 2000,
      render = "default",
      minimum_width = 50,
      fps = 60,
      top_down = false,
      background_colour = "#000000",
      level = vim.log.levels.INFO
    })

    -- Replace vim.notify with our filtered version
    vim.notify = filtered_notify

    -- Disable the built-in showing of messages in the command line
    vim.opt.cmdheight = 0

    -- Optionally suppress LSP messages specifically
    vim.lsp.handlers["window/showMessage"] = function() end
  end
}
