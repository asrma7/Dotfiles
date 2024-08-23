# Tmux Key Bindings

## General Commands

- **Reload Tmux Configuration**: `<prefix> r`
- **Describe Key Binding**: `<prefix> /`
- **List Key Bindings**: `<prefix> ?`
- **Customize Options**: `<prefix> C`
- **Show Messages**: `<prefix> ~`

## Window and Pane Management

- **Create New Window**: `<prefix> c`
- **Kill Current Window**: `<prefix> &`
- **Move Current Window**: `<prefix> .`
- **Rename Current Window**: `<prefix> ,`
- **Select Window 0-9**: `<prefix> 0` through `<prefix> 9`
- **Choose Window from List**: `<prefix> w`
- **List All Paste Buffers**: `<prefix> #`
- **Delete Most Recent Paste Buffer**: `<prefix> -`
- **Choose Paste Buffer from List**: `<prefix> =`
- **Rename Current Session**: `<prefix> $`
- **Kill Active Pane**: `<prefix> x`
- **Zoom Active Pane**: `<prefix> z`
- **Move Visible Part of Window**:
  - **Up**: `<prefix> S-Up`
  - **Down**: `<prefix> S-Down`
  - **Left**: `<prefix> S-Left`
  - **Right**: `<prefix> S-Right`

## Pane Navigation

- **Rotate Through Panes**: `<prefix> C-o`
- **Select Next Pane**: `<prefix> o`
- **Select Previous Pane**: `<prefix> p`
- **Select Pane Above/Below/Left/Right**:
  - **Above**: `<prefix> Up`
  - **Below**: `<prefix> Down`
  - **Left**: `<prefix> Left`
  - **Right**: `<prefix> Right`
- **Rotate Through Panes in Reverse**: `<prefix> M-o`

## Layout Management

- **Select Next Layout**: `<prefix> Space`
- **Set Layouts**:
  - **Even Horizontal**: `<prefix> M-1`
  - **Even Vertical**: `<prefix> M-2`
  - **Main Horizontal**: `<prefix> M-3`
  - **Main Vertical**: `<prefix> M-4`
  - **Tiled**: `<prefix> M-5`
- **Spread Panes Out Evenly**: `<prefix> E`

## Copy Mode

- **Enter Copy Mode**: `<prefix> [`
- **Begin Selection**: `v`
- **Begin Rectangle Selection**: `<ctrl> v`
- **Copy Selected Text and Cancel Selection**: `y`
- **Enter Copy Mode and Scroll Up**: `<prefix> PPage`

## Client and Session Management

- **Detach Current Client**: `<prefix> d`
- **Switch to Previous Client**: `<prefix> (`
- **Switch to Next Client**: `<prefix> )`
- **Choose and Detach Client**: `<prefix> D`
- **Switch to Last Client**: `<prefix> L`
- **Choose Session from List**: `<prefix> s`

## Paste and Selection

- **Paste Most Recent Paste Buffer**: `<prefix> ]`
- **Toggle Marked Pane**: `<prefix> m`
- **Clear Marked Pane**: `<prefix> M`
- **Show Clock**: `<prefix> t`

## Miscellaneous

- **Spread Panes Out Evenly**: `<prefix> E`
- **Search for Pane**: `<prefix> f`
- **Move to Previously Active Pane**: `<prefix> ;`
- **Show Pane Numbers**: `<prefix> q`
- **Show/Hide Marked Pane**: `<prefix> m`

## Key Binding for Plugins and External Commands

- **Cht.sh Integration**: `<prefix> i`
- **Open Pane in Same Directory**:
  - **Vertical Split**: `<prefix> "`
  - **Horizontal Split**: `<prefix> %`
- **Reload Tmux Configuration**: `<prefix> r`

## Pane Resizing

- **Resize Panes By 5**:
  - **Up**: `<prefix> M-Up`
  - **Down**: `<prefix> M-Down`
  - **Left**: `<prefix> M-Left`
  - **Right**: `<prefix> M-Right`
- **Resize Panes By 1**:
  - **Up**: `<prefix> C-Up`
  - **Down**: `<prefix> C-Down`
  - **Left**: `<prefix> C-Left`
  - **Right**: `<prefix> C-Right`

## Key Binding Navigation

- **Switch to Left Pane**: `<ctrl> h`
- **Switch to Below Pane**: `<ctrl> j`
- **Switch to Above Pane**: `<ctrl> k`
- **Switch to Right Pane**: `<ctrl> l`
