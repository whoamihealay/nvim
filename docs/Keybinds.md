## General Navigation

| Keybind | Mode | Description |
|---------|------|-------------|
| `<Tab>` | Normal | Next window |
| `<S-Tab>` | Normal | Previous window |
| `<C-d>` | Normal | Scroll down and center |
| `<C-u>` | Normal | Scroll up and center |
| `n` | Normal | Next search result centered |
| `N` | Normal | Previous search result centered |

## File Operations

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>fd` | Normal | File explorer |
| `<leader>e` | Normal | File Explorer (Snacks) |
| `<leader>ff` | Normal | Find Files |
| `<leader>fc` | Normal | Find Config File |
| `<leader>fg` | Normal | Find Git Files |
| `<leader>fp` | Normal | Projects |
| `<leader>fr` | Normal | Recent |

## Buffer Management

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>fb` | Normal | Buffers |
| `<S-h>` | Normal | Prev Buffer |
| `<S-l>` | Normal | Next Buffer |
| `[b` | Normal | Prev Buffer |
| `]b` | Normal | Next Buffer |
| `[B` | Normal | Move buffer prev |
| `]B` | Normal | Move buffer next |
| `<leader>bp` | Normal | Toggle Pin |
| `<leader>bP` | Normal | Delete Non-Pinned Buffers |
| `<leader>br` | Normal | Delete Buffers to the Right |
| `<leader>bl` | Normal | Delete Buffers to the Left |

## Harpoon

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>ha` | Normal | Harpoon add file |
| `<leader>hp` | Normal | Harpoon prepend file |
| `<leader>hm` | Normal | Harpoon quick menu |
| `<leader>1` | Normal | Harpoon to file 1 |
| `<leader>2` | Normal | Harpoon to file 2 |
| `<leader>3` | Normal | Harpoon to file 3 |
| `<leader>4` | Normal | Harpoon to file 4 |
| `<leader>5` | Normal | Harpoon to file 5 |
| `<leader>6` | Normal | Harpoon to file 6 |
| `<leader>7` | Normal | Harpoon to file 7 |
| `<leader>8` | Normal | Harpoon to file 8 |
| `<leader>9` | Normal | Harpoon to file 9 |

## Search & Replace

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>/` | Normal | Grep in project |
| `<leader>s` | Normal | Substitute word under cursor |

## Git Integration

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>gg` | Normal | Lazygit |
| `<leader>gb` | Normal | Git Branches |
| `<leader>gl` | Normal | Git Log |
| `<leader>gL` | Normal | Git Log Line |
| `<leader>gs` | Normal | Git Status |
| `<leader>gS` | Normal | Git Stash |
| `<leader>gd` | Normal | Git Diff (Hunks) |
| `<leader>gf` | Normal | Git Log File |

## Diagnostics & Trouble

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>xx` | Normal | Diagnostics (Trouble) |
| `<leader>xX` | Normal | Buffer Diagnostics (Trouble) |
| `<leader>xs` | Normal | Symbols (Trouble) |
| `<leader>xS` | Normal | LSP references/definitions/... (Trouble) |
| `<leader>xl` | Normal | Location List (Trouble) |
| `<leader>xq` | Normal | Quickfix List (Trouble) |
| `[q` | Normal | Previous Trouble/Quickfix Item |
| `]q` | Normal | Next Trouble/Quickfix Item |

## Text Editing

| Keybind | Mode | Description |
|---------|------|-------------|
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |
| `J` | Normal | Keep cursor in place when joining lines |
| `=ap` | Normal | Autoindent paragraph |
| `<leader>y` | Normal, Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>d` | Normal, Visual | Delete to void register |
| `<leader>p` | Visual | Paste over selection |
| `<C-bs>` | Insert | Delete word before cursor |

## Navigation Lists

| Keybind | Mode | Description |
|---------|------|-------------|
| `<C-k>` | Normal | Next quickfix item |
| `<C-j>` | Normal | Previous quickfix item |
| `<leader>k` | Normal | Next location list item |
| `<leader>j` | Normal | Previous location list item |
| `<leader>u` | Normal | Undo History |

## Session Management

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>qs` | Normal | Restore Session |
| `<leader>qS` | Normal | Select Session |
| `<leader>ql` | Normal | Restore Last Session |
| `<leader>qd` | Normal | Don't Save Current Session |

## LSP & Terminal

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>zig` | Normal | Restart LSP |
| `<C-p>` | Normal | Toggle Terminal |

## Other

| Keybind | Mode | Description |
|---------|------|-------------|
| `<leader>?` | Normal | Buffer Local Keymaps (which-key) |
| `Q` | Normal | Disable Ex mode |

## Completion

### Blink.cmp Keybinds

| Keybind | Description |
|---------|-------------|
| `C-space` | Open menu or open docs if already open |
| `C-n` / `Up` | Select next item |
| `C-p` / `Down` | Select previous item |
| `C-e` | Hide menu |
| `C-k` | Toggle signature help |
| `Tab` | Select next (fallback if menu closed) |
| `S-Tab` | Select previous (fallback if menu closed) |
| `Enter` | Accept completion |

## Leader Key

The leader key is mapped to **Space** (` `).
The local leader is mapped to **Backslash** (`\`).

## Key Groups (which-key)

- `<leader>b` - Buffer operations
- `<leader>f` - File/Find operations
- `<leader>g` - Git operations
- `<leader>h` - Harpoon operations
- `<leader>q` - Quit/Session operations
- `<leader>x` - Diagnostics operations
