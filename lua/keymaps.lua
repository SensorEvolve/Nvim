--local wk = require("which-key")
local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

vim.g.python3_host_prog = "/usr/local/bin/python3.11"

---------------------
-- General Keymaps
---------------------
-- Move lines
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move to first char
keymap.set("n", "<BS>", "^", { desc = "Move to first non blank char" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("v", "jk", "<ESC>", { desc = "Exit visual mode" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally

-- Save, Quit
keymap.set("n", "<Leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<Leader>Q", ":q!<CR>", { desc = "Quit without saving" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })

--Term
keymap.set("n", "<Leader>tt", "<cmd>term<CR>", { noremap = true, silent = true })

--Tab, Open and Close
keymap.set("n", "<Leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<Leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Command line, Replace text, Help
keymap.set("n", "<leader>cc", ":", { desc = "Cmdline" })
keymap.set("n", "<leader>cr", ":%s/", { desc = "Replace" })
keymap.set("n", "<leader>cC", ":help", { desc = "help" })

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

--Diagnostic

keymap.set(
  "n",
  "<leader>de",
  vim.diagnostic.open_float,
  { desc = "Open diagnostic float", noremap = true, silent = true }
)
keymap.set(
  "n",
  "<leader>dc",
  vim.diagnostic.setloclist,
  { desc = "Set diagnostic location list", noremap = true, silent = true }
)

-- Normal Mode mappings
keymap.set("n", "€", "$", { noremap = true, silent = true })
keymap.set("n", "$", "€", { noremap = true, silent = true })
-- Visual Mode mappings
keymap.set("v", "€", "$", { noremap = true, silent = true })
keymap.set("v", "$", "€", { noremap = true, silent = true })

-- Insert Mode mappings
keymap.set("i", "€", "$", { noremap = true, silent = true })
keymap.set("i", "$", "€", { noremap = true, silent = true })

-- Command Mode mappings
keymap.set("c", "€", "$", { noremap = true, silent = true })
keymap.set("c", "$", "€", { noremap = true, silent = true })

-- Operator Pending Mode mappings
keymap.set("o", "€", "$", { noremap = true, silent = true })
keymap.set("o", "$", "€", { noremap = true, silent = true })

-- Yank to Register
keymap.set("i", "<c-p>", function()
  require("telescope.builtin").registers()
end, { remap = true, silent = false, desc = "and paste register in insert mode" })
keymap.set("n", "<leader>yf", ":%y<cr>", { desc = "Yank the whole file" })

-- Yank Files PWD
vim.keymap.set("n", "«leader>w", ":w<CR»", { desc = "Quick Save" })
vim.keymap.set("n", "cx", ": !chmod +x %<cr>", { desc = "{make file executable" })
vim.keymap.set(
  "n",
  "<Leader>cpf",
  ':let @+ = expand("%:p") <cr>: lua print("Copied path to: " .. vim. fn.expand(*%:p"))<cr›',
  { desc = "Copy current file name and path", silent = false }
)

-- Center screen after various operations
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor centered" })

-- Nvim DAP
keymap.set("n", "<Leader>dbl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
keymap.set("n", "<Leader>dbj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
keymap.set("n", "<Leader>dbk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
keymap.set("n", "<Leader>dbc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
keymap.set("n", "<Leader>dbb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
keymap.set(
  "n",
  "<Leader>dbd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)

-- Next buffer
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true, silent = true })
-- Previous buffer
vim.api.nvim_set_keymap("n", "gT", ":bprevious<CR>", { noremap = true, silent = true })

-- Close Buffer: Maps <leader>bd to close the current buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close Buffer" })
-- Notes
vim.keymap.set("n", "<leader>n", ":e ~/notes/my-note.md<CR>", { desc = "Open my notes" })
