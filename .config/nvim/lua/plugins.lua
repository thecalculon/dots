
--   paq 'goerz/jupytext.vim'
--   let g:jupytext_enable = 1
--   let g:jupytext_command = 'jupytext'
--
--   paq 'PietroPate/vim-tex-conceal'
--   set conceallevel=2
--   let g:tex_conceal="abdgms"
--
--   Plug 'airblade/vim-gitgutter'
--
--   paq 'godlygeek/tabular'
--   " JSON front matter highlight plugin
--   paq 'elzr/vim-json'
--   paq 'plasticboy/vim-markdown'
--
--   let g:vim_markdown_folding_disabled = 1
--
--   " do not use conceal feature, the implementation is not so good
--   let g:vim_markdown_conceal = 0
--
--   " disable math tex conceal feature
--   let g:tex_conceal = ""
--   let g:vim_markdown_math = 1
--
--" support front matter of various format
--let g:vim_markdown_frontmatter = 1  " for YAML format
--let g:vim_markdown_toml_frontmatter = 1  " for TOML format
--let g:vim_markdown_json_frontmatter = 1  " for JSON format
--   paq 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
--   " like '/Users/username/highlight.css' or expand('~/highlight.css')
--   paq 'tpope/vim-commentary'
--   paq 'tpope/vim-surround'
--   paq 'honza/vim-snippets'
--   paq 'mbbill/undotree'
--   paq 'lervag/vimtex'
--   paq 'dhruvasagar/vim-table-mode'
--    noremap <leader>tm :Tablemode <CR>
--   function! s:isAtStartOfLine(mapping)
--       let text_before_cursor = getline('.')[0 : col('.')-1]
--       let mapping_pattern = '\V' . escape(a:mapping, '\')
--       let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
--       return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
--   endfunction
--
--   inoreabbrev <expr> <bar><bar>
--               \ <SID>isAtStartOfLine('\|\|') ?
--               \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
--   inoreabbrev <expr> __
--               \ <SID>isAtStartOfLine('__') ?
--               \ '<c-o>:silent! TableModeDisable<cr>' : '__'
--   let g:table_mode_corner='|'
--   let g:tex_flavor='latex'
--   let g:vimtex_view_general_viewer='zathura'
--   let g:vimtex_view_general_options='--synctex-forward @line:@col:@tex @pdf'
--   let g:vimtex_compiler_progname='nvr'
--   let g:vimtex_view_general_options_latexmk='--unique'
--   let g:vimtex_quickfix_mode=0
--   " let g:vimtex_quickfix_latexlog={'default' : 0}
--   let g:vimtex_complete_bib={'simple':1}
--   let g:vimtex_indent_enabled=1
--   let g:vimtex_indent_bib_enabled=1
--   let g:vimtex_format_enabled=1
--   let g:vimtex_toc_config={'show_help' : 0, 'hotkeys_enabled' : 1,
--               \ 'show_numbers': 0, 'hotkeys_leader' : '', 'layer_status':{'label':0}}
--   paq 'arcticicestudio/nord-vim'
--   paq 'rakr/vim-one'
--   paq 'lifepillar/vim-mucomplete'
--   paq 'morhetz/gruvbox'     
--   set completeopt+=menuone
--   set completeopt+=noselect
--   let g:mucomplete#enable_auto_at_startup = 1
--
--EOF

vf = require('vfuncs')
vf.plug.begin(vf.stdpath('data') .. '/plugged')
--new theme moving from gruvbox
vim.cmd("Plug 'ayu-theme/ayu-vim'")
vim.cmd("Plug 'dag/vim-fish'")
-- vscode plugins in vim
vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
-- semantic highlighting
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
-- smooth scrolling
vim.cmd("Plug 'psliwka/vim-smoothie'") 
-- statusline
--vim.cmd("Plug 'hoob3rt/lualine.nvim'")
-- theme
vim.cmd("Plug 'machakann/vim-sandwich'")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'junegunn/vim-easy-align'")

vf.plug['end']()

-- import plugs settings
require('plugs.treesitter')
require('plugs.ayu')
require('plugs.coc')
