local nnoremap = require("helvetici.keymap").nnoremap
local vnoremap = require("helvetici.keymap").vnoremap
local inoremap = require("helvetici.keymap").inoremap
local t_builtin = require("telescope.builtin")
local fzf = require("fzf-lua")
local neotest = require("neotest")

-- Base neovim re-bindings
nnoremap("<Leader>vv", "<cmd>so %<CR>")
nnoremap("[b", "<cmd>bprevious<CR>")
nnoremap("]b", "<cmd>bnext<CR>")
nnoremap("]b", "<cmd>bnext<CR>")

nnoremap("fd", "<Esc>")
inoremap("fd", "<Esc>")

inoremap("<C-s>", "<cmd>w<CR>")
nnoremap("<C-s>", "<cmd>w<CR>")

nnoremap("<C-l>", "<cmd>noh<CR>")

-- quickfix/loclist buffer navigation
nnoremap("<leader>qo", "<cmd>copen<CR>")
nnoremap("<leader>qc", "<cmd>cclose<CR>")
nnoremap("<leader>qn", "<cmd>cnext<CR>")
nnoremap("<leader>qp","<cmd>:cprevious<CR>")

nnoremap("<leader>lo", "<cmd>lopen<CR>")
nnoremap("<leader>lc", "<cmd>lclose<CR>")
nnoremap("<leader>ln", "<cmd>lnext<CR>")
nnoremap("<leader>lp","<cmd>:lprevious<CR>")

local close_other_buffers = function ()
	vim.cmd(":w|%bd!|e#|bd#")
end
nnoremap("<C-w>o", close_other_buffers)

-- I miss type :W fro :w a lot, so just dwim
vim.cmd('cnoreabbrev W w')

-- Plugins:
nnoremap("<C-p>", fzf.files)
nnoremap("<Leader>ff", fzf.live_grep)
nnoremap("<Leader>tc", t_builtin.colorscheme)

nnoremap("<Leader>b", "<cmd>NERDTreeToggle<CR>")
nnoremap("<Leader>nf", "<cmd>NERDTreeFind<CR>")

nnoremap("<C-_>", "<Plug>NERDCommenterToggle")
vnoremap("<C-_>", "<Plug>NERDCommenterToggle<CR>gv")

local function test_nearest()
	vim.cmd("wa")
	neotest.run.run({ strategy = "integrated" })
end

local function show_summary_window()
	neotest.summary.open()
end

local function show_latest_output()
	neotest.output.open()
end

nnoremap("<Leader>tn", test_nearest)
nnoremap("<Leader>ts", show_summary_window)
nnoremap("<Leader>to", show_latest_output)

-- Run on saves:
--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	--pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.astro" },
	--callback = function ()
		--vim.cmd("Prettier")
	--end
--})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.c" },
	callback = function ()
		vim.cmd("silent exec '!clang-format -i %'")
	end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.ex", "*.exs" },
	callback = function ()
		vim.cmd("silent exec '!mix format %'")
	end
})

vim.cmd("autocmd BufWritePre * :%s/\\s\\+$//e")
-- run RustFmt on save
vim.g.rustfmt_autosave = true

-- use ripgrep instead of standard grep
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
