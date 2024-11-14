vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--Hightlight word under cursor
opt.hlsearch = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_ruby_provider = 0

-- Highlight all instances of word under cursor
vim.opt.updatetime = 300 -- Faster than default (4000)
vim.o.inccommand = "split" -- Show live substitution results

-- Visual and yank highlighting
vim.cmd([[
highlight Visual guibg=#c678dd guifg=#ffffff gui=none
highlight! link HighlightedyankRegion Visual
]])

-- Set up yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "HighlightedyankRegion",
			timeout = 200,
			on_macro = true,
		})
	end,
})

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "☠️", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "‼️", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "📖", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "👉", texthl = "DiagnosticSignHint" })
