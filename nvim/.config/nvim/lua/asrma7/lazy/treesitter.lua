return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.install'.prefer_git = false
        require 'nvim-treesitter.install'.compilers = { "zig" }
        require("nvim-treesitter.configs").setup({
        ensure_installed = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "lua",
                    "go",
                    "bash",
                    "css",
                    "html",
                    "sql",
                    "markdown",
                    "latex",
                    "zig",
                    "terraform",
                    "yaml",
                    "json",
                    "python",
                    "toml",
                    "helm",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
                indent = {
                    enable = true,
                    disable = {},
                },
            })
    end,
}
