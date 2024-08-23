-- Map <leader>pv to open the Ex mode command-line window in normal mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Open Lazy Plugin Manager
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- Move selected line(s) down in visual mode and reselect the moved lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selected line(s) up in visual mode and reselect the moved lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join the current line with the next one, keeping the cursor in place
vim.keymap.set("n", "J", "mzJ`z")
-- Scroll half a page down and center the cursor vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Scroll half a page up and center the cursor vertically
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Jump to the next search result and center the cursor vertically
vim.keymap.set("n", "n", "nzzzv")
-- Jump to the previous search result and center the cursor vertically
vim.keymap.set("n", "N", "Nzzzv")
-- Map <leader>zig to restart the LSP (Language Server Protocol)
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Paste in visual mode, but do not overwrite the unnamed register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank text into the system clipboard in normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Yank the current line into the system clipboard in normal mode
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete text without affecting the unnamed register in normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Map <C-c> to <Esc> in insert mode (alternative way to exit insert mode)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the Q key in normal mode (often used to avoid accidental command recording)
vim.keymap.set("n", "Q", "<nop>")
-- Open a new tmux window running a sessionizer script with <C-f> in normal mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Move to the next quickfix item and center the cursor vertically with <C-;> in normal mode
vim.keymap.set("n", "<C-;>", "<cmd>cnext<CR>zz")
-- Move to the previous quickfix item and center the cursor vertically with <C-,> in normal mode
vim.keymap.set("n", "<C-,>", "<cmd>cprev<CR>zz")
-- Move to the next location list item and center the cursor vertically with <leader>k in normal mode
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- Move to the previous location list item and center the cursor vertically with <leader>j in normal mode
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the word under the cursor in the entire file with confirmation, using <leader>s in normal mode
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make the current file executable with <leader>x in normal mode
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Insert an if-err block below the cursor and position the cursor correctly with <leader>ee in normal mode
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Run the "make_it_rain" effect from the CellularAutomaton plugin with <leader>mr in normal mode
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Source the current Vim configuration file with <leader><leader> in normal mode
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Open git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Key mappings for resolving merge conflicts using diffget
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>") -- Theirs
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>") -- Mine

-- Key mappings for toggling undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Zen mode key mappings
vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").setup({
		window = {
			width = 90,
			options = {},
		},
	})
	require("zen-mode").toggle()
	vim.wo.wrap = false
	vim.wo.number = true
	vim.wo.rnu = true
	ColorMyPencils()
end)

vim.keymap.set("n", "<leader>zZ", function()
	require("zen-mode").setup({
		window = {
			width = 80,
			options = {},
		},
	})
	require("zen-mode").toggle()
	vim.wo.wrap = false
	vim.wo.number = false
	vim.wo.rnu = false
	vim.opt.colorcolumn = "0"
	ColorMyPencils()
end)

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Custom telescope keybinding to find files and open them in a vertical split with <leader>sv in normal mode
vim.keymap.set("n", "<leader>sv", function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local actions = require("telescope.actions")
				local entry = action_state.get_selected_entry()
				if entry == nil then
					return
				end
				actions.close(prompt_bufnr)
				vim.cmd("vsplit " .. entry.path)
			end)
			return true
		end,
	})
end, { noremap = true, silent = true })

-- Custom telescope keybinding to find files and open them in a horizontal split with <leader>sz in normal mode
vim.keymap.set("n", "<leader>sz", function()
	require("telescope.builtin").find_files({
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local actions = require("telescope.actions")
				local entry = action_state.get_selected_entry()
				if entry == nil then
					return
				end
				actions.close(prompt_bufnr)
				vim.cmd("split " .. entry.path)
			end)
			return true
		end,
	})
end, { noremap = true, silent = true })

-- Keybinds for toggling the terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>") -- Exit terminal mode
vim.keymap.set({ "n", "t" }, "<leader><C-\\>", function() -- Toggle terminal number
	local termNumber = vim.fn.input("Terminal > ")
	vim.cmd("ToggleTerm " .. termNumber)
end)

-- wrap selected text in quotes
vim.keymap.set("v", '<leader>"', 'c""<Esc>P')
vim.keymap.set("v", "<leader>'", "c''<Esc>P")
vim.keymap.set("v", "<leader>`", "c``<Esc>P")

-- wrap selected text in brackets
vim.keymap.set("v", "<leader>(", "c()<Esc>P")
vim.keymap.set("v", "<leader>[", "c[]<Esc>P")
vim.keymap.set("v", "<leader>{", "c{}<Esc>P")
vim.keymap.set("v", "<leader><", "c<><Esc>P")

-------------------------------
-- Keybinds in other plugins --
-------------------------------

-- # NumToStr/Comment.nvim
-- gcc to comment line
-- gc for comment operator
-- gcb for comment block
-- gb for comment block operator
-- gcO for comment above
-- gco for comment below
-- gcA for comment at eol

-- # tpope/vim-fugitive
-- <leader>gp git push
-- <leader>gP git pull --rebase
-- <leader>gpo git push -u origin

-- # lewis6991/gitsigns.nvim
-- ]c to navigate to the next Git hunk (or normal mode command `]c` if in diff mode)
-- [c to navigate to the previous Git hunk (or normal mode command `[c` if in diff mode)
-- <leader>hs to stage the current hunk
-- <leader>hr to reset the current hunk
-- <leader>hS to stage all hunks in the current buffer
-- <leader>hu to undo the staging of the last hunk
-- <leader>hR to reset all hunks in the current buffer
-- <leader>hp to preview the current hunk
-- <leader>hb to blame the current line
-- <leader>hd to show the diff for the current hunk
-- <leader>hD to show the diff for the entire file (or commit)
-- <leader>tb to toggle blame for the current line
-- <leader>tD to toggle the display of deleted lines
-- <leader>hs to stage the selected hunk in visual mode
-- <leader>hr to reset the selected hunk in visual mode

-- # jay-babu/mason-nvim-dap.nvim
-- <leader>b toggle breakpoint
-- <leader>B set breakpoint condition
-- <F5> start/continue
-- <F1> step into
-- <F2> step over
-- <F3> step out
-- <F7> see last session result

-- # ThePrimeagen/harpoon
-- <leader>a to add the current file to the Harpoon list
-- <C-e> to toggle the Harpoon quick menu
-- <C-1> to select the 1st file in the Harpoon list
-- <C-2> to select the 2nd file in the Harpoon list
-- <C-3> to select the 3rd file in the Harpoon list
-- <C-4> to select the 4th file in the Harpoon list
-- <C-S-P> to switch to the previous buffer in the Harpoon list
-- <C-S-N> to switch to the next buffer in the Harpoon list

-- # neovim/nvim-lspconfig
-- gd to go to definition
-- K to show hover information
-- <leader>vws to search for workspace symbols
-- <leader>vd to open a diagnostic float
-- <leader>vca to show code actions
-- <leader>vrr to list references
-- <leader>vrn to rename symbol
-- <C-/> to show signature help in insert mode
-- [d to go to the next diagnostic
-- ]d to go to the previous diagnostic

-- # stevearc/conform.nvim
-- <leader>f to format the current buffer (format on save enabled for some filetypes)

-- # hrsh7th/nvim-cmp
-- <C-n> to select the next completion item
-- <C-p> to select the previous completion item
-- <C-y> to confirm the currently selected completion item
-- <C-Space> to trigger completion

-- # L3MON4D3/LuaSnip
-- <C-s>e to expand a snippet in insert mode
-- <C-s>; to jump to the next snippet placeholder in insert mode
-- <C-s>, to jump to the previous snippet placeholder in insert mode
-- <C-E> to change the current choice if a choice list is active in insert mode

-- # nvim-telescope/telescope.nvim
-- <leader>pf to find files in the current directory
-- <C-p> to find files in the current Git repository
-- <leader>vk to list keymaps
-- <leader>vh to list help tags
-- <leader>pr to list old files
-- <leader>pws to grep for the current word under the cursor
-- <leader>pWs to grep for the current WORD under the cursor
-- <leader>ps to grep for a user-input search string
-- <leader>/ to fuzzy find within the current buffer with a dropdown theme
-- <leader>sn to find files within the Neovim configuration directory

-- # christoomey/vim-tmux-navigator
-- <c-h> to navigate left in tmux
-- <c-j> to navigate down in tmux
-- <c-k> to navigate up in tmux
-- <c-l> to navigate right in tmux
-- <c-//> to navigate to the previous tmux pane

-- # folke/trouble.nvim
-- <leader>tx to toggle diagnostics in Trouble
-- <leader>tX to toggle buffer diagnostics in Trouble
-- <leader>ts to toggle symbols in Trouble
-- <leader>tl to toggle LSP definitions/references in Trouble
-- <leader>tL to toggle location list in Trouble
-- <leader>tQ to toggle quickfix list in Trouble
