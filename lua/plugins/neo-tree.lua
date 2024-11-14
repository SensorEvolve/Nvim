return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.g.have_nerd_font = true
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "left",
				width = 30,
				popup_border_style = "Disable",
			},
			filesystem = {
				follow_current_file = {
					enabled = false, -- Disable auto-follow
				},
				use_libuv_file_watcher = false, -- Disable file watcher
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			default_component_configs = {
				icon = {
					folder_closed = "📁",
					folder_open = "📂",
					folder_empty = "📅",
				},
				git_status = {
					symbols = {
						added = "✨",
						modified = "🔮",
						deleted = "💫",
						renamed = "🪄",
						untracked = "★",
						ignored = "◌",
						unstaged = "○",
						staged = "●",
						conflict = "❌",
					},
				},
			},
			buffers = {
				follow_current_file = {
					enabled = false, -- Disable buffer following
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_leave",
					handler = function()
						vim.cmd("redraw")
					end,
				},
			},
		})
		vim.keymap.set("n", "<Tab>", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
