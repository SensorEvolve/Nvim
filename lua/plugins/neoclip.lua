return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("neoclip").setup({
			history = 1000,
			enable_persistent_history = false,
			length_limit = 1048576,
			continuous_sync = false,
			db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
			filter = nil,
			preview = true,
			prompt = nil,
			default_register = '"',
			default_register_macros = "q",
			enable_macro_history = true,
			content_spec_column = false,
			disable_keycodes_parsing = false,
			on_select = {
				move_to_front = false,
				close_telescope = true,
			},
			on_paste = {
				set_reg = false,
				move_to_front = false,
				close_telescope = true,
			},
			on_replay = {
				set_reg = false,
				move_to_front = false,
				close_telescope = true,
			},
			on_custom_action = {
				close_telescope = true,
			},
			keys = {
				telescope = {
					i = {
						select = "<cr>",
						paste = "<leader>p",
						paste_behind = "<leader>P",
						replay = "<leader>r", -- Changed from q to r
						delete = "<leader>d",
						edit = "<leader>e",
						custom = {},
					},
					n = {
						select = "<cr>",
						paste = "<leader>p",
						paste_behind = "<leader>P",
						replay = "<leader>r", -- Changed from q to r
						delete = "<leader>d",
						edit = "<leader>e",
						custom = {},
					},
				},
			},
		})

		-- Neoclip keymap using leader key
		vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
	end,
}
