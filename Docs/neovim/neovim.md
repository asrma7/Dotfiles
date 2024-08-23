# Neovim Keybindings

## Navigation
- **Move Lines**
  - `v` mode:
    - `J`: Move selected line(s) down and reselect
    - `K`: Move selected line(s) up and reselect
- **Page Scrolling**
  - `n` mode:
    - `<C-d>`: Scroll half a page down and center the cursor vertically
    - `<C-u>`: Scroll half a page up and center the cursor vertically
- **Search Results**
  - `n` mode:
    - `n`: Jump to the next search result and center the cursor vertically
    - `N`: Jump to the previous search result and center the cursor vertically
- **Jump to Location Lists**
  - `n` mode:
    - `<C-;>`: Move to the next quickfix item and center the cursor vertically
    - `<C-,>`: Move to the previous quickfix item and center the cursor vertically
    - `<leader>k`: Move to the next location list item and center the cursor vertically
    - `<leader>j`: Move to the previous location list item and center the cursor vertically
- **Prevent Arrow Key Usage**
    - `<arrow-key>`: Remind user to use vim keybindings

## Text Manipulation
- **Yank and Paste**
  - `n`, `v` mode:
    - `<leader>y`: Yank text into the system clipboard
    - `<leader>Y`: Yank the current line into the system clipboard
    - `<leader>p`: Paste in visual mode without overwriting the unnamed register
- **Delete and Change**
  - `n`, `v` mode:
    - `<leader>d`: Delete text without affecting the unnamed register
  - `v` mode:
    - `<leader>"`: Wrap selected text in double quotes
    - `<leader>'`: Wrap selected text in single quotes
    - ``<leader>` ``: Wrap selected text in backticks
    - `<leader>(`: Wrap selected text in parentheses
    - `<leader>[`: Wrap selected text in brackets
    - `<leader>{`: Wrap selected text in curly braces
    - `<leader><`: Wrap selected text in angle brackets

## File and Buffer Management
- **Open Files**
  - `n` mode:
    - `<leader>pv`: Open the Ex mode command-line window
    - `<leader>sv`: Find files and open them in a vertical split
    - `<leader>sz`: Find files and open them in a horizontal split
- **Plugin Manager**
  - `n` mode:
    - `<leader>l`: Open Lazy Plugin Manager
- **Terminal Management**
  - `n`, `t` mode:
    - `<leader><C-\\>`: Toggle terminal number
  - `t` mode:
    - `<Esc><Esc>`: Exit terminal mode
- **File Operations**
  - `n` mode:
    - `<leader>x`: Make the current file executable

## Visual Enhancements
- **Zen Mode**
  - `n` mode:
    - `<leader>zz`: Toggle Zen Mode with specific settings (width: 90, wrap: false, number: true, rnu: true)
    - `<leader>zZ`: Toggle Zen Mode with different settings (width: 80, wrap: false, number: false, rnu: false, colorcolumn: "0")

## Editing Enhancements
- **Join Lines**
  - `n` mode:
    - `J`: Join the current line with the next one, keeping the cursor in place
- **Insert Mode**
  - `i` mode:
    - `<C-c>`: Map to `<Esc>` for an alternative way to exit insert mode
- **Undo Tree**
  - `n` mode:
    - `<leader>u`: Toggle the undo tree

## Code and Debugging
- **LSP (Language Server Protocol)**
  - `n` mode:
    - `<leader>zig`: Restart the LSP
    - `gd`: Go to definition
    - `K`: Show hover information
    - `<leader>vws`: Search for workspace symbols
    - `<leader>vd`: Open a diagnostic float
    - `<leader>vca`: Show code actions
    - `<leader>vrr`: List references
    - `<leader>vrn`: Rename symbol
    - `[d`: Go to the next diagnostic
    - `]d`: Go to the previous diagnostic
  - `i` mode:
    - `<C-/>`: Show signature help in insert mode
- **Debugging**
  - `n` mode:
    - `<leader>b`: Toggle breakpoint
    - `<leader>B`: Set breakpoint condition
    - `<F5>`: Start/continue debugging
    - `<F1>`: Step into
    - `<F2>`: Step over
    - `<F3>`: Step out
    - `<F7>`: See last session result
- **Code Actions**
  - `n` mode:
    - `<leader>s`: Replace the word under the cursor in the entire file with confirmation
    - `<leader>ee`: Insert an if-err block below the cursor and position the cursor correctly
    - `<leader>mr`: Run the "make_it_rain" effect from the CellularAutomaton plugin
- **Completion**
  - `i` mode:
    - `<C-n>`: Select the next completion item
    - `<C-p>`: Select the previous completion item
    - `<C-y>`: Confirm the currently selected completion item
    - `<C-Space>`: Trigger completion
- ** Snippets**
  - `i` mode:
    - `<C-s>e`: Expand a snippet
    - `<C-s>;`: Jump to the next snippet placeholder
    - `<C-s>,`: Jump to the previous snippet placeholder
    - `<C-E>`: Change the current choice if a choice list is active
- **Trouble Management**
  - `n` mode:
    - `<leader>tx`: Toggle diagnostics in Trouble
    - `<leader>tX`: Toggle buffer diagnostics in Trouble
    - `<leader>ts`: Toggle symbols in Trouble
    - `<leader>tl`: Toggle LSP definitions/references in Trouble
    - `<leader>tL`: Toggle location list in Trouble
    - `<leader>tQ`: Toggle quickfix list in Trouble


## Git Integration
- **Git Status and Operations**
  - `n` mode:
    - `<leader>gs`: Open git status
    - `<leader>gp`: Git push
    - `<leader>gP`: Git pull --rebase
    - `<leader>gpo`: Git push -u origin
- **Git Hunk Management**
  - `n` mode:
    - `]c`: Navigate to the next Git hunk
    - `[c`: Navigate to the previous Git hunk
    - `<leader>hs`: Stage the current hunk
    - `<leader>hr`: Reset the current hunk
    - `<leader>hS`: Stage all hunks in the current buffer
    - `<leader>hu`: Undo the staging of the last hunk
    - `<leader>hR`: Reset all hunks in the current buffer
    - `<leader>hp`: Preview the current hunk
    - `<leader>hb`: Blame the current line
    - `<leader>hd`: Show the diff for the current hunk
    - `<leader>hD`: Show the diff for the entire file (or commit)
    - `<leader>tb`: Toggle blame for the current line
    - `<leader>tD`: Toggle the display of deleted lines
  - `v` mode:
    - `<leader>hs` (visual mode): Stage the selected hunk
    - `<leader>hr` (visual mode): Reset the selected hunk

- **Conflict Resolution**
  - `n` mode:
    - `gu`: Resolve conflicts by selecting "Theirs"
    - `gh`: Resolve conflicts by selecting "Mine"

## Miscellaneous
- **Source Configuration**
  - `n` mode:
    - `<leader><leader>`: Source the current Vim configuration file
- **Run Command**
  - `n` mode:
    - `<C-f>`: Open a new tmux window running a sessionizer script
- **Commenting**
  - `n`, `v` mode:
    - `gcc`: Comment line
    - `gc`: Comment operator
    - `gcb`: Comment block
    - `gb`: Comment block operator
    - `gcO`: Comment above
    - `gco`: Comment below
    - `gcA`: Comment at end of line
- **Conform Formatting**
  - `n` mode:
    - `<leader>f`: Format the current buffer
- **Harpoon**
  - `n` mode:
    - `<leader>a`: Add the current file to the Harpoon list
    - `<C-e>`: Toggle the Harpoon quick menu
    - `<C-1>` to `<C-4>`: Select the corresponding file in the Harpoon list
    - `<C-S-P>`: Switch to the previous buffer in the Harpoon list
    - `<C-S-N>`: Switch to the next buffer in the Harpoon list
- **Telescope**
  - `n` mode:
    - `<leader>pf`: Find files in the current directory
    - `<C-p>`: Find files in the current Git repository
    - `<leader>vk`: List keymaps
    - `<leader>vh`: List help tags
    - `<leader>pr`: List old files
    - `<leader>pws`: Grep for the current word under the cursor
    - `<leader>pWs`: Grep for the current WORD under the cursor
    - `<leader>ps`: Grep for a user-input search string
    - `<leader>/`: Fuzzy find within the current buffer with a dropdown theme
    - `<leader>sn`: Find files within the Neovim configuration directory

## Terminal Navigation
- **Tmux Navigation**
  - `n` mode:
    - `<c-h>`: Navigate left in tmux
    - `<c-j>`: Navigate down in tmux
    - `<c-k>`: Navigate up in tmux
    - `<c-l>`: Navigate right in tmux
    - `<c-//>`: Navigate to the previous tmux pane
