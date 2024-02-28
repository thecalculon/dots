require("modus-themes").setup({
	-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
	-- `auto` will automatically set style based on background set with vim.o.background
	style = "modus_vivendi",
	variant = "tritanopia", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
	transparent = false, -- Transparent background (as supported by the terminal)
	dim_inactive = false, -- "non-current" windows are dimmed
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
	on_colors = function(colors) end,
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
--
-- vim.cmd([[colorscheme modus]])
vim.cmd([[colorscheme modus]])
nvimModes = {"Normal", "NormalFloat", "LineNr", "SignColumn"}
for i,vm in ipairs(nvimModes) do
   vim.api.nvim_set_hl(0, vm, { bg = "none" })
end

-- vim.o.background = "dark" -- or "light" for light mode
