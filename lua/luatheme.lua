-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  pink     = '#ff75a0',
  teal     = '#00b4b4',
}

-- Mode names and icons
local mode_icons = {
	n = "󰆧 NORMAL",
	i = "󰏫 INSERT",
	v = "󰆏 VISUAL",
	V = "󰯎 V-LINE",
	--  [""] = "󰯏 V-BLOCK", -- Fix: This handles visual block mode
	c = " COMMAND",
	no = "󰆧 N-OPERATOR",
	s = "󰓡 SELECT",
	S = "󰓡 S-LINE",
	[""] = "󰓡 S-BLOCK",
	ic = "󰏫 INSERT-COMP",
	R = "󰊄 REPLACE",
	Rv = "󰊄 V-REPLACE",
	cv = " VIM-EX",
	ce = " EX",
	r = "󰛔 PROMPT",
	rm = "󰛔 MORE",
	["r?"] = "󰛔 CONFIRM",
	t = " TERMINAL",
}

-- Added time formatting function
local function time()
	return os.date("%H:%M")
end

-- Added word count function
local function word_count()
	local wc = vim.fn.wordcount()
	if wc["visual_words"] then
		return wc["visual_words"] .. " words selected"
	else
		return wc["words"] .. " words"
	end
end

-- Added file info function
local function file_info()
	local file = vim.fn.expand("%:t")
	local ext = vim.fn.expand("%:e")
	local icon = require("nvim-web-devicons").get_icon(file, ext)
	return string.format("%s %s", icon or "", file or "No File")
end

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
		disabled_filetypes = { "NvimTree", "dashboard" }, -- Added disabled filetypes
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 0, right = 1 },
})

ins_left({
	-- mode component
	function()
		local mode = vim.fn.mode()
		return string.format(" %s ", mode_icons[mode] or mode)
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			["v"] = colors.magenta, -- Fix: Added explicit visual mode
			["V"] = colors.magenta, -- Fix: Added explicit visual line mode
			c = colors.orange,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			t = colors.red,
		}
		return {
			fg = colors.bg,
			bg = mode_color[vim.fn.mode()] or colors.blue,
			gui = "bold",
		}
	end,
	padding = { right = 1 },
})

-- Enhanced vim mode status indicator with animations
ins_left({
	function()
		local mode = vim.fn.mode()
		local status = {
			n = "זּ Ready",
			i = " Editing",
			v = " Selection",
			V = "謹 Line Select",
			[""] = "礪 Block Select",
			c = " Command",
			R = "הּ Replace",
			t = " Editing",
		}
		-- Added spinning cursor animation for insert mode
		if mode == "i" then
			local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
			return spinners[math.floor(os.clock() * 8) % #spinners + 1] .. status[mode]
		end
		return status[mode] or mode
	end,
	color = function()
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.magenta,
			V = colors.magenta,
			--[""] = colors.magenta,
			c = colors.orange,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			--[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			t = colors.red,
		}
		return {
			fg = mode_color[vim.fn.mode()] or colors.blue,
			gui = "bold,italic",
		}
	end,
	padding = { left = 1, right = 2 },
})

-- Added file icon and name with enhanced styling
ins_left({
	file_info,
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
	"filesize",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.green },
})

ins_left({
	"location",
	color = { fg = colors.orange, gui = "bold" },
})

-- Added word count component
ins_left({
	word_count,
	color = { fg = colors.cyan, gui = "italic" },
	cond = conditions.hide_in_width,
})

ins_left({
	"progress",
	color = { fg = colors.fg, gui = "bold" },
})

-- Enhanced diagnostics with more detailed icons
ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = " ",
		warn = " ",
		info = " ",
		hint = " ",
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
		color_hint = { fg = colors.green },
	},
})

ins_left({
	function()
		return "%="
	end,
})

-- Enhanced LSP component with icon
ins_left({
	function()
		local msg = "No LSP"
		local buf_ft = vim.bo.filetype
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return " " .. msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return " " .. client.name
			end
		end
		return " " .. msg
	end,
	color = { fg = "#51AFEF", gui = "bold" },
})

-- Added time component
ins_right({
	time,
	color = { fg = colors.blue, gui = "bold" },
})

ins_right({
	"o:encoding",
	fmt = string.upper,
	cond = conditions.hide_in_width,
	color = { fg = colors.green, gui = "bold" },
})

ins_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = true,
	color = { fg = colors.green, gui = "bold" },
})

ins_right({
	"branch",
	icon = "",
	color = { fg = colors.violet, gui = "bold" },
})

-- Enhanced diff component with better symbols
ins_right({
	"diff",
	symbols = {
		added = " ",
		modified = "󰝤 ",
		removed = " ",
	},
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return "▊"
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})

lualine.setup(config)
