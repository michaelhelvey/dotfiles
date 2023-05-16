vim.g.base16colorspace = 256

require("tokyonight").setup({
	style = "night",
	transparent = true
})

require('rose-pine').setup({
	dark_variant = 'main',
	disable_background = false,
	disable_float_background = false
})

vim.g.gruvbox_contrast_dark = 'hard'

vim.g.sonokai_style = 'shusia'
vim.g.sonokai_better_performance = 1

vim.g.edge_style = 'default'
vim.g.edge_better_performance = 1

vim.opt.termguicolors = true
vim.opt.background = "dark"

require('lualine').setup({
	options = {
		-- theme = "rose-pine",
		theme = "auto",
	}
})

function SetColorScheme(color)
	color = color or "GruberDarker"
	vim.cmd.colorscheme(color)

	 --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	 --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
-- require('colorbuddy').colorscheme('gruvbuddy')

-- Random settings dump:
