vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- A couple of plugins to make life a little easier:
require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'justinmk/vim-sneak',
  'ap/vim-buftabline',
  'mg979/vim-visual-multi',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'github/copilot.vim',
    config = function()
      -- If we don't do this and we ever install something like nvim-cmp, it
      -- will yell about tab already being mapped
      vim.g.copilot_assume_mapped = true
    end
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  { 'blazkowolf/gruber-darker.nvim', },
  {
    'craftzdog/solarized-osaka.nvim',
    config = function()
      require('solarized-osaka').setup({
        transparent = false,
        on_colors = function() end,
        on_highlights = function() end
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true
      })
    end
  },
  "MunifTanjim/nui.nvim",

  require 'msh.plugins.neovim',
  require 'msh.plugins.lsp',
  require 'msh.plugins.autoformat'
})

-- Global settings:
vim.opt.listchars = { tab = '→ ', space = '·' }
vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.undofile = true
vim.wo.relativenumber = true
-- vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.smartcase = true
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.completeopt = 'menuone,noselect'
vim.wo.signcolumn = 'yes'

-- Keymaps:
vim.keymap.set({ 'n', 'v', 'i', }, 'fd', '<Esc>', { silent = true }) -- my wrists dont work
vim.keymap.set({ 'n' }, "[b", "<cmd>bprevious<CR>")
vim.keymap.set({ 'n' }, "]b", "<cmd>bnext<CR>")
vim.keymap.set({ 'n' }, '<C-w>o', function()
  vim.cmd(':w|%bd!|e#|bd#')
end)
vim.cmd('cnoreabbrev W w') -- I hit shift too much

-- Plugin setup:
require 'msh.plugins.neovim_after'
require 'msh.plugins.lsp_after'

-- Color theme:
vim.cmd.colorscheme 'catppuccin'

-- vim: ts=2 sts=2 sw=2 et
