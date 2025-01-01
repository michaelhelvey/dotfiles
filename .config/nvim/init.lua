-- Global settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', space = '·',  nbsp = '␣' }
vim.opt.cursorline = true
-- grep exclude binary, include line numbers, skip devices & sockets (+ exclude-dirs)
vim.opt.grepprg = 'grep -InDskip --exclude-dir=.git --exclude-dir=.zig-cache'
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.cmd("set path+=**")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'tpope/vim-sensible',
  'RRethy/base16-nvim',
  'blazkowolf/gruber-darker.nvim',
  'p0209p/naysayer.vim'
})

vim.cmd('colorscheme base16-tomorrow-night-eighties')
