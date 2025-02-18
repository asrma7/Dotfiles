return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "lua_ls",
                    "cssls",
                    "gopls",
                    "html",
                    "emmet_language_server",
                    "tailwindcss",
                    "eslint",
                    "zls",
                    "marksman",
                    "sqlls",
                    "intelephense",
                    "jsonls",
                    "pylsp",
                    "ts_ls",
                    "vimls",
                    "yamlls",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.sqlls.setup({
                capabilities = capabilities,
            })

            lspconfig.intelephense.setup({
                capabilities = capabilities,
            })

            lspconfig.texlab.setup({
                capabilities = capabilities,
            })

            lspconfig.zls.setup({
                capabilities = capabilities,
            })

            lspconfig.bashls.setup({
                capabilities = capabilities,
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Recognize 'vim' as a global variable
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true), -- Include neovim runtime
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "php",
                    "blade",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                },
            })

            lspconfig.emmet_language_server.setup({
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "php",
                    "blade",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                    "markdown",
                },
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "php",
                    "blade",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                },
                root_dir = require("lspconfig").util.root_pattern(
                    "tailwind.config.js",
                    "tailwind.config.cjs",
                    "tailwind.config.mjs",
                    "tailwind.config.ts",
                    "postcss.config.js",
                    "postcss.config.cjs",
                    "postcss.config.mjs",
                    "postcss.config.ts",
                    "package.json",
                    "node_modules",
                    ".git"
                )
            })

            local configs = require("lspconfig.configs")

            if not configs.ts_ls then
                configs.ts_ls = {
                    default_config = {
                        cmd = { "typescript-language-server", "--stdio" },
                        capabilities = capabilities,
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "html",
                        },
                        root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
                    },
                }
            end
            lspconfig.ts_ls.setup({
            })

            lspconfig.eslint.setup({
                capabilities = capabilities,
            })

            function get_python_path()
                local venv_path = os.getenv("VIRTUAL_ENV")
                if venv_path then
                    return venv_path .. "/bin/python3"
                else
                    local os_name = require("asrma7.utils").get_os()
                    if os_name == "windows" then
                        return "C:/python312"
                    else
                        return "/usr/bin/python3"
                    end
                end
            end

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = get_python_path(),
                    },
                },
            })

            lspconfig.marksman.setup({
                capabilities = capabilities,
            })
        end,
    }
}
