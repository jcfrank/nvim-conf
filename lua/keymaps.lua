-- essentials
vim.keymap.set('n', '\\b', ':Buffers<CR>', {desc="fzf buffers."})
vim.keymap.set('n', '\\f', ':Files<CR>', {desc="fzf files."})
vim.keymap.set('n', '\\l', ':Lines<CR>', {desc="fzf Lines."})
vim.keymap.set('n', '\\c', ':Commands<CR>', {desc="fzf Commands."})
vim.keymap.set('n', '\\n', ':NERDTree %:h<CR>', {desc="NERDTree."})
vim.keymap.set('n', '\\s', ':split<CR>', {desc="Horizontal split."})
vim.keymap.set('n', '\\v', ':vsplit<CR>', {desc="Vertical split."})
vim.keymap.set('n', '\\t', ':tabedit<CR>', {desc="New tab."})
vim.keymap.set('n', '<C-p>', ':Files<CR>', {desc="CtrlP simulation."})
vim.keymap.set('i', ',,', '<C-x><C-o>', {desc="Code completion.", noremap = true})


-- lsp
--[[
  In addition, these default mappings exitst:
      gq:  vim.lsp.buf.format
      K:   vim.lsp.buf.hover
      gc:  toggle comment
      gcc: toggle comment line
  See `:help vim.lsp.buf` for documentation.
]]--
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


-- cscope
vim.keymap.set('n', '<C-\\>s', ':Cs find s <C-r>=expand("<cword>")<CR><CR>', {desc="Find all references to the token under cursor."})
vim.keymap.set('n', '<C-\\>g', ':Cs find g <C-r>=expand("<cword>")<CR><CR>', {desc="Find global definition(s) of the token under cursor."})
vim.keymap.set('n', '<C-\\>c', ':Cs find c <C-r>=expand("<cword>")<CR><CR>', {desc="Find all calls to the function name under cursor."})
vim.keymap.set('n', '<C-\\>t', ':Cs find t <C-r>=expand("<cword>")<CR><CR>', {desc="Find all instances of the text under cursor."})
vim.keymap.set('n', '<C-\\>e', ':Cs find e <C-r>=expand("<cword>")<CR><CR>', {desc="Egrep search for the word under cursor."})
vim.keymap.set('n', '<C-\\>f', ':Cs find f <C-r>=expand("<cword>")<CR><CR>', {desc="Open the filename under cursor."})
vim.keymap.set('n', '<C-\\>i', ':Cs find i <C-r>=expand("<cword>")<CR><CR>', {desc="Find files that include the filename under cursor."})
vim.keymap.set('n', '<C-\\>d', ':Cs find d <C-r>=expand("<cword>")<CR><CR>', {desc="Find functions that function under cursor calls."})
vim.keymap.set('n', '<C-\\>a', ':Cs find a <C-r>=expand("<cword>")<CR><CR>', {desc="Find places where this symbol is assigned a value."})
