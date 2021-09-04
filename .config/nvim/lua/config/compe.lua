vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 4
require("compe").setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 3,
    preselect = "always",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = false,
    source = {
        buffer = true,
        calc = false,
        nvim_lsp = true,
        nvim_lua = true,
        omni = {filetypes = {'tex'}},
        path = true,
        spell = {filetypes = {'markdown', 'tex'}},
        tags = false,
        treesitter = true,
        ultisnips = true,
        vsnip = false,
    },
})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-n>")
    elseif check_back_space() then
        return t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end
_G.shift_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-p>")
    else
        return t("<S-Tab>")
    end
end

local flags = { expr = true, silent = true }
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", flags)
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", flags)
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.shift_tab_complete()", flags)
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.shift_tab_complete()", flags)
vim.api.nvim_set_keymap("i", "<CR>", "v:lua.shift_tab_complete()", flags)
-- vim.api.nvim_set_keymap(
--     "i",
--     "<CR>",
--     [[compe#confirm("\<Plug>(PearTreeExpand)")]],
--     flags
-- )
