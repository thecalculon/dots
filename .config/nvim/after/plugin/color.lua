 -- Default options:
 -- require('ayu').setup({
 --     mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
 --     overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
 -- })
 ----
require("modus-themes").setup({
	-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
	-- `auto` will automatically set style based on background set with vim.o.background
	style = "modus_vivendi",
	variant = "tritanopia", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
	transparent = false, -- Transparent background (as supported by the terminal)
	dim_inactive = false, -- "non-current" windows are dimmed
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) end,
})



-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--     italic = {
--     strings = true,
--     emphasis = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = true,
-- })
-- function ColorMyPencils(color) 
-- 	color = color or "gruvbox"
-- 	vim.cmd.colorscheme(color)
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

-- ColorMyPencils("gruvbox")
-- vim.cmd([[colorscheme modus]])
vim.cmd("colorscheme modus")
--
-- vim.o.background = "dark" -- or "light" for light mode
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
