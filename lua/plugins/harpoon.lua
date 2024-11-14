return {
	"ThePrimeagen/harpoon",
	config = function()
		-- Define Harpoon key mappings
		vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add File" })
		vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Next Mark" })
		vim.keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Previous Mark" })
		vim.keymap.set("n", "<leader>hm", "<cmd>Telescope harpoon marks<CR>", { desc = "List Marks" })

		-- Add more mappings for Harpoon as needed
	end,
}
