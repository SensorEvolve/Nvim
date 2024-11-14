return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" }, -- Removed space after "truncate"
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- Load telescope extensions (moved inside config function)
    telescope.load_extension("fzf")

    -- Set keymaps without using which-key
    local keymap = vim.keymap
    -- Require telescope.builtin module
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
    keymap.set("n", "<leader>fw", "/", { desc = "Search word" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Telescope registers" })
    -- Yank to Register
    keymap.set("i", "<c-p>", function()
      require("telescope.builtin").registers()
    end, { remap = true, silent = false, desc = "and paste register in insert mode" })
  end,
}
