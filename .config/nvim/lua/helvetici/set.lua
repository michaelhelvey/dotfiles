-- Settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.encoding = 'utf-8'

-- indentation:
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.signcolumn = "number"
vim.opt.laststatus = 2
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false

vim.g.mapleader = " "
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = [[menuone,noinsert,noselect]]
vim.opt.listchars = { tab = '→ ', space = '·' }

-- Autogroups
vim.cmd('autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 noexpandtab')
vim.cmd('autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 noexpandtab')
vim.cmd('autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab')
vim.cmd('autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab')
vim.cmd('autocmd FileType markdown setlocal textwidth=80 conceallevel=0')
vim.cmd('autocmd FileType qf setlocal wrap')
vim.cmd('autocmd FileType lf setlocal wrap')
