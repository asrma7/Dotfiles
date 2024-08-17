return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'markdown', 'ruby' },
        },
        indent = {
            enable = true,
            disable = { 'ruby' },
        },
    },
    config = function(_, opts)
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}
