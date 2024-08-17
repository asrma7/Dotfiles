return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 20,
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'horizontal',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'single',
                width = 200,
                height = 50,
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        }

        vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
        vim.keymap.set({"n", "t"}, '<leader><C-\\>', function()
             local termNumber = vim.fn.input("Terminal > ")
            vim.cmd("ToggleTerm " .. termNumber)
        end)
    end
}
