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
inoremap ,, <C-x><C-o>


"" feline
lua require("feline").setup()
"" cscope
lua require("cscope_maps").setup()


"" cscope
nmap <C-\>s :Cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :Cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :Cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :Cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :Cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :Cs find d <C-R>=expand("<cword>")<CR><CR>


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
let g:jedi#completions_command = "<leader>c"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#rename_command_keep_name = "<leader>R"
