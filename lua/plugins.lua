return {
	-- File Navigation
	-- Plugins for browsing and managing files and buffers
	{ "nvim-telescope/telescope.nvim" }, -- Fuzzy finder and file search
	{ "nvim-tree/nvim-web-devicons" }, -- File icons for Neovim
	{ "nvim-neo-tree/neo-tree.nvim" }, -- File explorer for Neovim
	{ "mbbill/undotree" }, -- Visualize and manage undo history
	{ "folke/which-key.nvim" }, -- Display available keybindings in a popup
	{ "stevearc/conform.nvim" },

	-- UI Enhancements
	-- Plugins to enhance the user interface and experience
	{ "MunifTanjim/nui.nvim" }, -- UI component library for Neovim
	{ "norcalli/nvim-colorizer.lua" }, -- Color highlighting for hex codes

	-- LSP and Completion
	-- Plugins for language server protocol and auto-completion
	{ "williamboman/mason.nvim" }, -- Manage LSP servers, DAP servers, and linters
	{ "williamboman/mason-lspconfig.nvim" }, -- LSP config for Mason
	{ "neovim/nvim-lspconfig" }, -- Quickstart configurations for Nvim LSP
	{ "hrsh7th/nvim-cmp" }, -- Autocompletion plugin
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }, -- Debugger UI for Neovim
	-- Terminal Management
	-- Plugins for terminal integration
	{ "akinsho/toggleterm.nvim" }, -- Terminal management within Neovim

	-- Additional Enhancements
	-- Miscellaneous plugins that enhance workflow
	{ "christoomey/vim-tmux-navigator" }, -- Navigate between tmux and Neovim seamlessly
	{ "m4xshen/autoclose.nvim" }, -- Auto-close brackets and quotes
	{ "junegunn/vim-peekaboo" }, -- Enhanced register preview
	{ "AckslD/nvim-neoclip.lua" }, -- Clipboard manager for Neovim
	{ "lewis6991/gitsigns.nvim" }, -- Git signs in the gutter
	{ "echasnovski/mini.icons" }, -- Mini icons for Neovim
	{ "nvim-treesitter/nvim-treesitter" }, -- Syntax highlighting and code folding
	{ "nvim-telescope/telescope-ui-select.nvim" }, -- UI selector for Telescope
	{ "ThePrimeagen/harpoon" }, -- Bookmarking and navigation within files
	{ "nvim-lualine/lualine.nvim" },
	{ "goolord/alpha-nvim" },
	{ "MeanderingProgrammer/render-markdown.nvim" },
	{ "ggandor/leap.nvim" },
	{ "s1n7ax/nvim-window-picker" },
	{ "rcarriga/nvim-notify" },
}
