require("neotest").setup({
	adapters = {
		require("neotest-python"),
		require("neotest-go"),
		require("neotest-rust"),
		--require("neotest-jest"),
		require("neotest-vitest"),
	}
})
