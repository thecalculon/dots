-- vim.cmd [[ packadd nlua.nvim ]]
local lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
--
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  require("lsp_signature").on_attach({ floating_window = false })
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--
lsp["pylsp"].setup({
    autostart = autostart,
    on_attach = on_attach,
    pyls = {
        plugins = {
            yapf = { enable = false },
            autopep8 = { enable = false },
            pylint = { enable = false },
            pycodestyle = { enable = false },
        },
    },
})

lsp["fortls"].setup({
    autostart = autostart,
    cmd = {
        "/home/vikash/.local/bin/fortls",
        "--incremental_sync",
        "--use_signature_help",
        "--lowercase_intrinsics",
    },
    root_dir = lsp.util.root_pattern(".git"),
    filetypes = { "fortran" },
    on_attach = on_attach,
    settings = { nthreads = 1 },
})




