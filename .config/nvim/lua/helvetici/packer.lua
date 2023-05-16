return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'folke/neodev.nvim'

	-- Color / UI theming:
	use 'folke/tokyonight.nvim'
	use 'morhetz/gruvbox'
	use 'sainnhe/sonokai'
	use 'sainnhe/edge'
	use 'drsooch/gruber-darker-vim'
	use 'haishanh/night-owl.vim'
	use 'joshdick/onedark.vim'
	use 'tjdevries/colorbuddy.vim'
	use 'tjdevries/gruvbuddy.nvim'
	use 'RRethy/nvim-base16'
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
	})
	use 'michaelhelvey/naysayer88.vim'
	use 'phha/zenburn.nvim'

	-- IDE features:
	use 'preservim/nerdtree'
	use 'preservim/nerdcommenter'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-sensible'
	use 'justinmk/vim-sneak'
	use 'mattn/emmet-vim'

	use 'vijaymarupudi/nvim-fzf'
	use 'ibhagwan/fzf-lua'

	use 'mg979/vim-visual-multi'
	use 'editorconfig/editorconfig-vim'
	use 'ap/vim-buftabline'

	use 'mfussenegger/nvim-lint'
	use { 'nvim-neotest/neotest', requires = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'antoinemadec/FixCursorHold.nvim',
		-- adapters:
		'nvim-neotest/neotest-python',
		'haydenmeade/neotest-jest',
		'marilari88/neotest-vitest',
		'rouge8/neotest-rust',
		'nvim-neotest/neotest-go',
	}}


	-- LSP configuration:
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- Language-specific plugins:
	use 'prettier/vim-prettier'
	use 'rust-lang/rust.vim'
	use 'wuelnerdotexe/vim-astro'
	use 'ziglang/zig.vim'
	use 'elixir-editors/vim-elixir'
end)
