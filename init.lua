vim.o.relativenumber = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.confirm = true
vim.o.shiftwidth = 4
vim.o.tabstop = 8
vim.o.softtabstop = 4
--vim.o.expandtab = true
vim.o.cursorline = true
vim.o.colorcolumn = '80'
vim.o.termguicolors = true


-- Plugs
local Plug = vim.fn['plug#']
vim.call('plug#begin')
--[[
  The default plugin directory will be as follows:
    - Vim (Linux/macOS): '~/.vim/plugged'
    - Vim (Windows): '~/vimfiles/plugged'
    - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  You can specify a custom plugin directory by passing it as the argument
    - e.g. `call plug#begin('~/.vim/plugged')`
    - Avoid using standard Vim directory names like 'plugin'

  Make sure you use single quotes
--]]

-- Shorthand notation for GitHub; translates to https://github.com/preservim/nerdtree
Plug('preservim/nerdtree')
Plug('junegunn/fzf', { ['do'] = function()
    vim.fn['fzf#install']()
end})
Plug('junegunn/fzf.vim')
Plug('tpope/vim-fugitive')
Plug('feline-nvim/feline.nvim')
Plug('dhananjaylatkar/cscope_maps.nvim')
Plug('Vimjas/vim-python-pep8-indent')
Plug('nvie/vim-flake8')
Plug('neovim/nvim-lspconfig')
Plug('ms-jpq/coq_nvim', { ['branch'] = 'coq'})
Plug('ms-jpq/coq.artifacts', { ['branch'] = 'artifacts'})
--[[
  Initialize plugin system
  - Automatically executes `filetype plugin indent on` and `syntax enable`.
]]-- 
vim.call('plug#end')
--[[
  You can revert the settings after the call like so:
    vim.cmd('filetype indent off')  " Disable file-type-specific indentation
    vim.cmd('syntax off')       " Disable syntax highlighting
]]--


-- Color schemes should be loaded after plug#end().
vim.cmd.colorscheme('murphy')


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


-- key mappings
require('keymap')
