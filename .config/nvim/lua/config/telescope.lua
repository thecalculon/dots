local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        prompt_prefix = " >",
        color_devicons = false,
        shorten_path = false,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            i = { ["<esc>"] = actions.close, ["<C-q>"] = actions.send_to_qflist },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "dotfiles",
        shorten_path = false,
        cwd = "$HOME/dotfiles/",
    })
end
M.search_home = function()
    require("telescope.builtin").find_files({
        find_command = {
            "fd",
            "--type",
            "f",
            "-E",
            "opt*",
            "-E",
            "*.pdf",
            "-E",
            "*.png",
        },
        prompt_title = "home",
        shorten_path = false,
        cwd = "$HOME/",
    })
end
M.search_plugins = function()
    require("telescope.builtin").find_files({
        prompt_title = "plugins",
        shorten_path = false,
        cwd = "$HOME/.local/share/nvim/plugged/",
    })
end

vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    [[<cmd>Telescope find_files<CR>]],
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    [[<cmd>Telescope live_grep<CR>]],
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    [[<cmd>Telescope buffers<CR>]],
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    [[:lua require('config.telescope').search_home()<CR>]],
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fd",
    [[:lua require('config.telescope').search_dotfiles()<CR>]],
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fp",
    [[:lua require('config.telescope').search_plugins()<CR>]],
    { noremap = true }
)

return M
