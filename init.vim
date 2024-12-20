"" customize settings
"set number
set relativenumber
set showmatch
set ignorecase
set confirm
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab
set cursorline
"" Highlighting column 80 for visual width
set colorcolumn=80
colorscheme murphy
set termguicolors
let mapleader = "\\\\"


"" vim-plug
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'feline-nvim/feline.nvim'
Plug 'dhananjaylatkar/cscope_maps.nvim'
Plug 'davidhalter/jedi-vim'
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


lua << EOL
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
vim.keymap.set({'n','v'}, 'gra', vim.lsp.buf.code_action, {desc="List code actions."})
vim.keymap.set('n', 'gC', vim.lsp.buf.incoming_calls, {desc="Go to incoming calls."})
vim.keymap.set({'n','v'}, '<space>tH', function()
  vim.lsp.buf.typehierarchy'supertypes'
end, {desc="List supertypes."})
vim.keymap.set({'n','v'}, '<space>th', function()
  vim.lsp.buf.typehierarchy'subtypes'
end, {desc="List subtypes."})
EOL


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


"" vim-go
"" GoDef jumps to definition.
"" GoDefPop jumps back from definition.
"" GoDecls searches definitions in current file.
"" GoDeclsDir searches definitions in current folder.
"" ]] jumps to next func.
"" [[ jumps to previous func.
"<C-]> and <C-t> calls GoDef and GoDefPop too.
autocmd FileType go nmap <leader>d :GoDef<CR>
autocmd FileType go nmap <leader>p :GoDefPop<CR>
"GoDecls and GoDeclsDir depend on ctrlp.
autocmd FileType go nmap <leader>l :GoDecls<CR>
autocmd FileType go nmap <leader>s :GoDeclsDir<CR>
autocmd FileType go nmap <leader>e :GoReferrers<CR>
autocmd FileType go nmap <leader>i :GoImplements<CR>
autocmd FileType go nmap <leader>c :GoCallers<CR>
autocmd FileType go nmap <leader>f :GoFmt<CR>
autocmd FileType go nmap <leader>b :GoBuild<CR>
autocmd FileType go nmap <leader>r :GoRun<CR>


"" jedi-vim
"" Uncomment and update for custom bindings.
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_stubs_command = "<leader>s"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<leader>c"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#rename_command_keep_name = "<leader>R"
