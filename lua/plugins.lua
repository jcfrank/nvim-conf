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
--[[
   * https://github.com/junegunn/fzf.vim?tab=readme-ov-file
   * https://github.com/junegunn/fzf
   `brew install ripgrep`
]]--
Plug('junegunn/fzf', { ['do'] = function()
    vim.fn['fzf#install']()
end})
Plug('junegunn/fzf.vim')
Plug('tpope/vim-fugitive')
Plug('feline-nvim/feline.nvim')
Plug('dhananjaylatkar/cscope_maps.nvim')
Plug('Vimjas/vim-python-pep8-indent')
-- `pip install flake8`
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
