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
-- https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup(coq.lsp_ensure_capabilities{})
-- python jedi
-- https://github.com/pappasam/jedi-language-server
-- `pip install jedi-language-server`
lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities{})
--[[
-- pyright
-- https://github.com/microsoft/pyright
-- `pip install pyright`
lspconfig.pyright.setup(coq.lsp_ensure_capabilities{})
]]--
-- jsonls
-- https://github.com/hrsh7th/vscode-langservers-extracted
--`npm i -g vscode-langservers-extracted`
lspconfig.jsonls.setup(coq.lsp_ensure_capabilities{})
-- yamlls
-- https://github.com/redhat-developer/yaml-language-server
--`yarn global add yaml-language-server`
lspconfig.yamlls.setup(coq.lsp_ensure_capabilities{})
-- protols
-- https://github.com/coder3101/protols
--[[
   `cargo install protols`
   Install clang-format to enable lsp format.
   E.g. In MacOS, `brew install clang-format`.
]]--
lspconfig.protols.setup(coq.lsp_ensure_capabilities{})
