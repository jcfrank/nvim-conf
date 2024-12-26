"" customize settings
set relativenumber
set showmatch
set ignorecase
set confirm
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab
set cursorline
set colorcolumn=80
colorscheme murphy
set termguicolors
let mapleader = "\\\\"


"" Plugs
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation for GitHub; translates to https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'feline-nvim/feline.nvim'
Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


"" key mappings
nmap \b :Buffers<CR>
nmap \f :Files<CR>
nmap \l :Lines<CR>
nmap \c :Commands<CR>
nmap \n :NERDTree %:h<CR>
nmap \s :split<CR>
nmap \v :vsplit<CR>
nmap \t :tabedit<CR>
" simulates CtrlP with fzf
nmap <c-p> :Files<CR>
" code completion
inoremap ,, <C-x><C-o>


lua << EOLUA
-- feline
require'feline'.setup()
-- cscope
require'cscope_maps'.setup{
  disable_maps = true
}
-- coq
vim.g.coq_settings = {
  auto_start = 'shut-up',
  ['display.icons.mode'] = 'none',
}
-- rust
local lspconfig = require'lspconfig'
local coq = require'coq'
lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities{
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
})
-- golang
lspconfig.gopls.setup(coq.lsp_ensure_capabilities{})
-- python jedi
lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities{})

-- lsp key mappings
-- In addition, these default mappings exitst:
--     gq:  vim.lsp.buf.format
--     K:   vim.lsp.buf.hover
--     gc:  toggle comment
--     gcc: toggle comment line
-- See `:help vim.lsp.buf` for documentation.
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc="Go to declaration."})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc="Go to definition."})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc="Go to implementation."})
vim.keymap.set('n', 'grr', vim.lsp.buf.references, {desc="Go to references."})
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, {desc="Rename selected symbol."})
vim.keymap.set({'n','v'}, 'gla', vim.lsp.buf.code_action, {desc="List code actions."})
vim.keymap.set('n', 'gC', vim.lsp.buf.incoming_calls, {desc="Go to incoming calls."})
vim.keymap.set('n', 'gls', vim.lsp.buf.workspace_symbol, {desc="List all symbols in the current workspace."})
vim.keymap.set('n', 'gf', ":silent !black -l 79 %<CR>", {desc="Format current buffer with black."})
vim.keymap.set('n', 'gfi', ":silent !isort %<CR>", {desc="Format current buffer with isort."})
vim.keymap.set('n', 'gff', ":Flake<CR>", {desc="Run Flake8."})
vim.keymap.set({'n','v'}, 'gq', vim.lsp.buf.format, {desc="LSP format current buf."})
vim.keymap.set({'n','v'}, '<space>tH', function()
  vim.lsp.buf.typehierarchy'supertypes'
end, {desc="List supertypes."})
vim.keymap.set({'n','v'}, '<space>th', function()
  vim.lsp.buf.typehierarchy'subtypes'
end, {desc="List subtypes."})
EOLUA


"" cscope
"find all references to the token under cursor
nmap <C-\>s :Cs find s <C-R>=expand("<cword>")<CR><CR>
"find global definition(s) of the token under cursor
nmap <C-\>g :Cs find g <C-R>=expand("<cword>")<CR><CR>
"find all calls to the function name under cursor
nmap <C-\>c :Cs find c <C-R>=expand("<cword>")<CR><CR>
"find all instances of the text under cursor
nmap <C-\>t :Cs find t <C-R>=expand("<cword>")<CR><CR>
"egrep search for the word under cursor
nmap <C-\>e :Cs find e <C-R>=expand("<cword>")<CR><CR>
"open the filename under cursor
nmap <C-\>f :Cs find f <C-R>=expand("<cword>")<CR><CR>
"find files that include the filename under cursor
nmap <C-\>i :Cs find i <C-R>=expand("<cword>")<CR><CR>
"find functions that function under cursor calls
nmap <C-\>d :Cs find d <C-R>=expand("<cword>")<CR><CR>
"find places where this symbol is assigned a value
nmap <C-\>a :Cs find a <C-R>=expand("<cword>")<CR><CR>
