return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"vimdoc",
			"javascript",
			"typescript",
			"c",
			"lua",
			"rust",
			"jsdoc",
			"bash",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "markdown", "ruby" },
		},
		indent = {
			enable = true,
			disable = { "ruby" },
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
