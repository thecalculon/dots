local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.wildmenu = true
o.showcmd = true
o.undolevels=10000    --     " use many levels of undo
vim.cmd("set undodir=$HOME/.vim/undo")
o.undofile = true

-- global options
o.swapfile = false
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.textwidth=84
-- ... snip ... 

-- window-local options
wo.number = false
wo.wrap = true

-- buffer-local options
bo.expandtab = true  

af = require('autofunc')
bo = require('bufopt')

-->> window <<--

-- show file numbers
wo.number = false
-- relative file numbers
wo.relativenumber = false
vim.wo.signcolumn = 'number'

-- set font in gui
if vim.o.guifont then
  vim.o.guifont = 'IBM Plex Mono SemiBold'
end

-- split a new buffer to the right
o.splitright = true
-- split new buffer to the bottom
o.splitbelow = true
-- briefly jump to matching seperator
o.showmatch = true
-- case insensitive search
o.ignorecase = true
-- highlight searches
o.hlsearch = true
-- copy-paste with system clipboard
-- o.clipboard = 'unnamedplus'
-- background color for themes
o.background = 'dark'
-- we support termguicolors
o.termguicolors = true
-- abandon buffer when unloading
o.hidden = true
-- some language servers dont like backup files
o.backup = false
o.writebackup = false
-- more space for coc messages
-- o.cmdheight = 2
--
-- more responsiveness
o.updatetime = 300
-- avoid some prompts?
o.shortmess = vim.o.shortmess .. 'c'
-- scrolling "bounding"
o.scrolloff = 5
o.sidescrolloff = 5

-->> buffer options <<--
bo.tabstop = 4
-- implicit tab size
bo.softtabstop = 4
-- another kind of stabstop
bo.shiftwidth = 4
-- convert tabs to spaces
bo.expandtab = true
bo.autoindent = true

vim.cmd('syntax on')
-- enable filetype detection
vim.cmd('filetype plugin indent on')

vim.cmd('let fortran_free_source=1')
vim.cmd('let fortran_do_enddo=1')
vim.cmd('let fortran_have_tabs=1')
vim.cmd('let fortran_more_precise=1')

--Fortran Folding

vim.cmd('let fortran_fold=1')
vim.cmd('let fortran_fold_conditionals=1')
vim.cmd('let fortran_fold_multilinecomments=1')

--"au FileType fortran set foldmethod=syntax"


--set history=10000    " After nocompatible
--o.undofile = true
--vim.cmd("set undodir='$HOME/.vim/undo'")
--o.undolevels=10000     --    " use many levels of undo
--set viminfo='100,<500,s20,h
--bo.history=2048
--set backspace=indent,eol,start


