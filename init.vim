set nocompatible " ------------------ Plugins -------------------

" Vim-Plug
call plug#begin()

" UI
Plug 'chriskempson/base16-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'cocopon/iceberg.vim'
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'nanotech/jellybeans.vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'chriskempson/base16-vim'
Plug 'kkga/vim-envy'
Plug 'tomasiser/vim-code-dark'
Plug 'chiendo97/intellij.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hoob3rt/lualine.nvim'
Plug 'ap/vim-buftabline'
Plug 'haishanh/night-owl.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'invrainbow/naysayer88.vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'joshdick/onedark.vim'

" Text Editing
" Plug 'yggdroot/indentline'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'rbgrouleff/bclose.vim', {'branch': 'master'}
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
" Plug 'vim-scripts/paredit.vim'

" File Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" IDE features, mostly stolen from jonhoo
Plug 'neovim/nvim-lspconfig', { 'branch': 'master' }
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-cmdline', {'branch': 'main' }
Plug 'vim-test/vim-test'
Plug 'ray-x/lsp_signature.nvim'

" Becuase nvim-cmp requires snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" JS/TS
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Python
Plug 'psf/black'
Plug 'vim-python/python-syntax'

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve'

" Other
Plug 'cespare/vim-toml'
Plug 'ziglang/zig.vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

" Rust
Plug 'rust-lang/rust.vim'

" ------------------ Base Vim Setup -------------------

syntax on
set exrc
"set gcr=
set noshowmode
set nofoldenable
set foldmethod=indent
set smartcase
set autoindent smartindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=-1
set mouse=a
set relativenumber
set laststatus=2
set number
set nowrap
set colorcolumn=
set noswapfile
set hidden
set nobackup
set nowritebackup
set backspace=indent,eol,start
set modelines=0
set nomodeline
set encoding=utf-8
set signcolumn=number
set cmdheight=1
set updatetime=300
set shortmess+=c
set pumblend=15
set incsearch
set autoread		" auto-reload files when they change outside of vim
set listchars=tab:→\ ,space:·
filetype plugin on	" auto-load plugin files for each file type
set scrolloff=5

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
end

" ------------------ Misc Keybindings -------------------

let mapleader = " "
let g:bclose_no_plugin_maps=1

noremap fd <Esc>
inoremap fd <Esc>
noremap [b :bprevious<CR>
noremap ]b :bnext<CR>
noremap <C-l> :noh<CR>

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
nnoremap <C-s> :w<CR>
" I miss type W for w a lot, and I'd rather just dwim than give me an error
cnoreabbrev W w
" same...
cnoreabbrev E e

nnoremap <leader>w :Bclose<CR>
nnoremap <leader>dw :bd<CR>

nnoremap <leader>gco :GoCoverageToggle<CR>

command! BufOnly silent! execute "%bd|e#|bd#"

" quickfix/loclist buffer navigation
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp  :cprevious<CR>

nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp  :lprevious<CR>

" source configuration file
nnoremap <leader>vv :source ~/.config/nvim/init.vim<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" ------------------ Add Plugins -------------------

call plug#end()

" ------------------ Lanaguage-Specific Indentation Defaults -------------------

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType markdown setlocal textwidth=80 conceallevel=0

" Remove all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" ------------------ NVIM LSP Bindings & Functions -------------------

"  VLIME, lisp
let g:vlime_compiler_policy = {"DEBUG": 3}

" Completion
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

lua << EOF
local cmp = require'cmp'
local lspconfig = require'lspconfig'

-- Setup completion
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  completion = {
	  autocomplete = true,
  },
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
	  if cmp.visible() then
		cmp.select_prev_item()
	  end
	end, { "i", "s" }),
	},
  sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }),
  experimental = {
	  ghost_text = true,
  },
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'cmdline' },
    { name = 'buffer' }
  })
})

-- purposely global so that we can reference this function in project-local settings
msh_lsp_on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- how to trigger completion automatically?
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

	 -- Get signatures (and _only_ signatures) when in argument lists.
	require "lsp_signature".on_attach({
		doc_lines = 0,
		handler_opts = {
		  border = "none"
		},
	})
end -- end msh_lsp_on_attach

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "pyright", "rust_analyzer", "tsserver", "clangd", "intelephense", "gopls", "ocamllsp", "clojure_lsp", "zls", "solargraph" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup { on_attach = msh_lsp_on_attach, capabilities = capabilities }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)
EOF

" ------------------ Languages & IDE Settings -------------------

" Temporary binding for learning zig
nmap <leader>zr :! zig run % <CR>

" Run prettier on save
autocmd BufWritePre *.ts,*.tsx,*.js,*jsx execute ':Prettier'
" Run CljFmt on save
autocmd BufWritePost *.clj silent execute ':! lein cljfmt fix %' | silent edit!
" Run RustFmt on save
let g:rustfmt_autosave = 1

" Run elm-format on save
au BufWritePost *.elm silent exe ":! elm-format --yes %" | silent edit!

" Debugger key-bindings
let g:vimspector_enable_mappings = 'HUMAN'
nmap <F2> :VimspectorReset<CR>
nmap <leader>di <Plug>VimspectorBalloonEval

"Test runner settings
function! MTestNearest()
	wa
	TestNearest
endfunction

nnoremap <leader>tn :call MTestNearest()<CR>
function! DebugNearest()
	let g:test#go#runner = 'delve'
	TestNearest
	unlet g:test#go#runner
endfunction
nmap <silent> <leader>td :call DebugNearest()<CR>

let test#python#runner = "pytest"
let g:python_highlight_all = 1
let g:black_linelength = 79
let g:python3_host_prog = "/home/helvetici/.local/share/virtualenvs/helvetici-QlSWnqaG/bin/python"
"autocmd BufWritePre *.py silent! execute ':Black'

" ------------------ Tree sitter configuration -------------------

lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { },				-- List of parsers to ignore installing
	highlight = {
		enable = false,					-- enable/disable colors
	},
}
EOF

" ------------------ File Naviagation -------------------

noremap <C-b> :NERDTreeToggle<CR>
noremap <leader>nf :NERDTreeFind<CR>

" use ripgrep instead of standard grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let g:nerdtree_sync_cursorline = 1
let NerdTreeShowHidden = 1

let global_file_ignore_globs = [
			\	"!node_modules/*",
			\	"!.git/*",
			\	"!.ccls-cache/*",
			\	"!*.o",
			\	"!vendor/*",
			\	"!build/*",
			\	"!.clangd/*",
			\	"!__pycache__/*",
			\	"!*.map",
			\	"!*.sum",
			\	"!_build/*",
			\	"!zig-cache/*",
			\	"!zig-out/*"
			\ ]

let find_file_args = ["rg", "-i", "--hidden", "--files"]
for glob in global_file_ignore_globs
	call extend(find_file_args, ["-g", glob])
endfor

let find_file_lua_script = "require'telescope.builtin'.find_files{ find_command = { \"" . join(find_file_args, '", "') . "\" } }"

" Customized version of find_files that uses my custom command above instead
" of hiding non git-tracked and hidden files
nnoremap <C-P> :call luaeval(find_file_lua_script)<cr>

" Customized version of find command that will filter results more accurately
" than the default, and also ignore files in my ignore patterns above
let search_in_files_args = ["rg", "-i", "--hidden", "--column", "--line-number", "--no-heading", "--color=always"]
for glob in global_file_ignore_globs
	call extend(search_in_files_args, ["-g", "'" . glob . "'" ])
endfor

let search_in_files_cmd = join(search_in_files_args)

command! -bang -nargs=* Rg
			\ call fzf#vim#grep(
			\   search_in_files_cmd . ' -- ' . shellescape(<q-args>), 1,
			\   fzf#vim#with_preview(), <bang>0)

nnoremap <leader>tt <cmd>Telescope treesitter<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tp <cmd>Telescope man_pages<cr>
nnoremap <leader>tq <cmd>Telescope quickfix<cr>
nnoremap <leader>tc <cmd>Telescope colorscheme<cr>
nnoremap <leader>tds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>tws <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

let $FZF_DEFAULT_OPTS='--reverse'

nmap <silent> <leader>ff :Rg<cr>
nmap <silent> <leader>fm :Marks<cr>
nmap <silent> <leader>fl :BLines<cr>
nmap <silent> <leader>fc :BCommits<cr>
nmap <silent> <C-Space> :Commands<cr>

" ------------------ Color Theme -------------------

lua << EOF
-- require'lualine'.setup {
--  options = {
--	theme = 'sonokai'
--  }
-- }
EOF

let g:gruvbox_material_background='hard'
let g:gruvbox_contrast_dark = 'hard'

let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1

let g:edge_style = 'neon'
let g:edge_better_performance = 1

if !has('gui_running')
  set t_Co=256
endif

set termguicolors
set background=dark
let base16colorspace=256

colorscheme sonokai

hi Normal guibg=gray10
hi EndOfBuffer guibg=gray10

source "./color_utils.vim"

# changes
