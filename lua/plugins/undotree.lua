return {
	"mbbill/undotree",
	config = function()
		-- Set layout to style 3
		vim.g.undotree_WindowLayout = 3
		-- u for undo (default behavior, you don't need to remap it if it's unchanged)
		vim.keymap.set("n", "u", "u", { desc = "Undo" })

		-- <leader>ut to toggle the undo tree
		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
	end,
}
