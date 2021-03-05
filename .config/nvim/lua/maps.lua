--- lua file for keybindings
-- maps.lua
--
local map = vim.api.nvim_set_keymap
-- need to use this later
--local function map(mode, lhs, rhs, opts)
--  local options = {noremap = true}
--  if opts then options = vim.tbl_extend('force', options, opts) end
--  map(mode, lhs, rhs, options)
--end




-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables
-- because thats what `let` does...
vim.b.mapleader = ' '



options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '<Backspace>', '<C-^>', options)

--options = { inoremap = true }
--map('n', '<C-h>', '<Left>', options)
--map('n', '<C-k>', '<Up>', options)
--map('n', '<C-j>', '<Down>', options)
--map('n', '<C-l>', '<Right>', options)


