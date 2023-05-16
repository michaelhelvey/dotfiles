require("nvim-treesitter.configs").setup({
	-- Install parsers for the following languages:
	ensure_installed = {
		"c",
		"lua",
		"cpp",
		"lua",
		"rust",
		"typescript",
		"javascript",
		"python",
		"go",
		"zig",
		"astro",
		"elixir",
	},
	sync_install = false,
	auto_install = true,
})
