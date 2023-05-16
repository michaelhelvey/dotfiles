require("neodev").setup({
	-- neodev options
})

local config = require("lspconfig")
local lint = require("lint")
local util = require("lspconfig/util")

local path = util.path


local on_attach = function(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true, silent=false }

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition({ reuse_win = true })<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Servers that we can configure "automatically" without any custom settings (see below for custom settings)
local servers = {
	"rust_analyzer",
	"tsserver",
	"clangd",
	"gopls",
	"zls",
	"astro",
	"tailwindcss",
}

for _, lsp in ipairs(servers) do
	config[lsp].setup{
		on_attach = on_attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	}
end

local function get_python_path(workspace)
	local match = vim.fn.glob(path.join(workspace, 'Pipfile'))

	-- Attempt to use the pipenv virtualenv where possible:
	if match ~= '' then
		local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv --quiet'))
		local python_path = path.join(venv, 'bin', 'python')
		return python_path
	end

	-- Fallback to system Python.
	return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

config.pyright.setup{
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	before_init = function(_, c)
		c.settings.python.pythonPath = get_python_path(c.root_dir)
		c.settings.python.analysis.typeCheckingMode = "off"
	end
}

config.elixirls.setup{
	cmd = { "/Users/helvetici/.local/bin/elixir/language_server.sh" };
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}


config.lua_ls.setup{
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
		},
	},
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

config.omnisharp.setup{
	cmd = { "dotnet", "/Users/helvetici/.vscode/extensions/ms-dotnettools.csharp-1.25.2-darwin-arm64/.omnisharp/1.39.2-net6.0/OmniSharp.dll" },
	enable_editorconfig_support = true,
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- Linting Configuration:

lint.linters_by_ft = {
	javascript = { 'eslint', },
	typescript = { 'eslint', },
	typescriptreact = { 'eslint', },
	javascriptreact = { 'eslint', },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		lint.try_lint(nil, { ignore_errors = true })
	end,
})

