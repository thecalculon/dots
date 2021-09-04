vim.g.tex_flavor = "latex"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex @pdf"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.vimtex_view_general_options_latexmk = "--unique"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_ignore_filters = { "Warning", "Overfull", "I found" }
vim.g.vimtex_complete_bib = { simple = 1, menu_fmt = "| @title" }
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_indent_bib_enabled = 1
vim.g.vimtex_indent_ignored_envs = { "document", "columns" }
vim.g.vimtex_format_enabled = 1
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_fold_levelmarker = ">>"
vim.g.vimtex_toc_config = {
    hotkeys_enabled = 1,
    hotkeys_leader = "",
    layer_status = { label = 0 },
    show_help = 0,
    show_numbers = 0,
}
vim.g.vimtex_syntax_conceal = {
    accents = 1,
    cites = 1,
    fancy = 1,
    greek = 1,
    math_bounds = 0,
    math_delimiters = 1,
    math_fracs = 0,
    math_super_sub = 0,
    math_symbols = 1,
    styles = 0,
}
