return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      close_on_exit = false,
      autochdir = true,
      shell = vim.o.shell,
      size = 20,
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-esc>", [[<C-\><C-n><C-W>k]], opts)
    end

    -- Use _G.set_terminal_keymaps() to match the function name
    vim.cmd("autocmd! TermOpen term://* lua _G.set_terminal_keymaps()")
  end,
}
