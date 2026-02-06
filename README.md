# Neovim Configuration

A fully-featured Neovim configuration built with [Lazy.nvim](https://github.com/folke/lazy.nvim) package manager, designed for modern development with support for LSP, AI assistance, and a rich ecosystem of plugins.

## Features

### 🎨 Visual Enhancements

- **Multiple Color Schemes**: Rose Pine (Moon), Tokyo Night, Gruvbox, and Brightburn
- **Smart UI Components**:
  - Bufferline for buffer management
  - Lualine status bar
  - Mini icons for file type indicators
  - Git signs integration for file changes
  - Snacks explorer for file navigation

### 🛠️ Development Tools

- **Language Server Protocol (LSP)** support with automatic server installation via Mason
- **Completion Engine**: Blink.cmp with snippet support and multi-source completion
- **Treesitter** for syntax highlighting and parsing
- **Diagnostics & Debugging**:
  - Trouble plugin for organized diagnostics
  - Diagnostic navigation and filtering

### 🔧 Supported Languages & Tools

Automatic installation of LSP servers and formatters for:

- **Languages**: Lua, JavaScript/TypeScript, YAML, JSON, Terraform, Helm, Docker, Ansible, Vim
- **Tools**: Prettier, Stylua, Hadolint, Markdownlint, Ansible Lint, TFLint

### 🚀 Productivity Features

- **Harpoon**: Quick file navigation and jumping (mark up to 9 files with `<leader>1-9`)
- **Git Integration**:
  - Lazygit terminal interface
  - Git branch browser
  - Git log viewer
  - Diff hunks
  - Stash management
- **AI Assistance**:
  - GitHub Copilot integration
  - CodeCompanion for AI-powered code assistance with markdown support
  - Image clipping for markdown/documentation

### 📝 Text Editing

- **Smart Pair Matching**: Auto-pair brackets, quotes, etc.
- **Formatter Integration**: Automatic code formatting
- **Search & Replace**: Project-wide grep and substring replacement
- **File Picker**: Fuzzy file search with preview

### ⚙️ Customization

- Relative line numbers with normal numbering
- 2-space indentation
- 80-character column indicator
- Undo persistence with undodir
- Incremental search with centering
- Terminal integration

## Installation

### Prerequisites

- Neovim 0.11+
- Git
- Node.js/npm (for some LSP servers)
- Rust/cargo (optional, for fuzzy matcher compilation)
- tree-sitter CLI

### Setup

1. Clone this configuration:

```bash
git clone <repository-url> ~/.config/nvim
```

1. Start Neovim:

```bash
nvim .
```

The first launch will automatically:

- Install Lazy.nvim package manager
- Download and install all configured plugins
- Install LSP servers and formatters via Mason

### Optional: Copilot Setup

To use GitHub Copilot:

```vim
:Copilot auth
```

## Keybindings

See [Keybinds.md](docs/Keybinds.md).

## Project Structure

```
.
├── init.lua                 # Entry point
├── lazy-lock.json          # Locked plugin versions
├── docs/
│   └── Keybinds.md        # Complete keybinding reference
└── lua/whoamihealay/
    ├── init.lua           # Module initialization
    ├── set.lua            # Vim options
    ├── remap.lua          # Custom keymaps
    ├── lazy_init.lua      # Lazy.nvim setup
    ├── autocmds.lua       # Auto commands
    └── lazy/              # Plugin specifications
        ├── init.lua       # Plenary dependency
        ├── ai.lua         # AI tools (Copilot, CodeCompanion)
        ├── cmp.lua        # Blink completion engine
        ├── colors.lua     # Color schemes
        ├── diagnostics.lua # Trouble & diagnostics
        ├── formatting.lua # Code formatters
        ├── harpoon.lua    # Harpoon navigation
        ├── lazydev.lua    # LazyDev support
        ├── mason.lua      # LSP server management
        ├── snacks.lua     # Snacks utilities
        ├── treesitter.lua # Syntax highlighting
        ├── ui.lua         # UI enhancements
        ├── util.lua       # Utilities
        └── which-keys.lua # Which-key help
```

## Plugin Ecosystem

### Core Plugins

- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Package manager
- **[Plenary](https://github.com/nvim-lua/plenary.nvim)** - Common utilities

### Editing & Completion

- **[Blink.cmp](https://github.com/saghen/blink.cmp)** - Fast fuzzy completion
- **[Friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Snippet collection
- **[Mini.pairs](https://github.com/nvim-mini/mini.pairs)** - Auto-pairing

### UI & Visual

- **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** - Status line
- **[Bufferline](https://github.com/akinsho/bufferline.nvim)** - Buffer tabs
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Git change indicators
- **[Mini.icons](https://github.com/nvim-mini/mini.icons)** - Icon integration
- **[Snacks](https://github.com/folke/snacks.nvim)** - Collection of utilities

### Syntax & Colors

- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Parser generator
- **[Rose Pine](https://github.com/rose-pine/neovim)** - Color scheme
- **[Tokyo Night](https://github.com/folke/tokyonight.nvim)** - Color scheme
- **[Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)** - Color scheme

### Development Tools

- **[Mason](https://github.com/mason-org/mason.nvim)** - Tool installer
- **[Mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)** - LSP configuration
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP support
- **[Trouble](https://github.com/folke/trouble.nvim)** - Diagnostics display

### Git & Navigation

- **[Harpoon](https://github.com/ThePrimeagen/harpoon)** - File navigation
- **[Lazygit](https://github.com/jesseduffield/lazygit)** - Git UI (via Snacks)

### AI Assistance

- **[GitHub Copilot](https://github.com/github/copilot.vim)** - Code completion
- **[CodeCompanion](https://github.com/olimorris/codecompanion.nvim)** - AI chat interface
- **[Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Markdown preview
- **[Markview](https://github.com/OXY2DEV/markview.nvim)** - Markdown viewer
- **[Img-clip](https://github.com/HakonHarnes/img-clip.nvim)** - Image pasting

### Documentation & Development

- **[LazyDev](https://github.com/folke/lazydev.nvim)** - Lua API completions

## Configuration Tips

### Customize Color Scheme

Edit [lua/whoamihealay/lazy/colors.lua](lua/whoamihealay/lazy/colors.lua#L1) to change the default color scheme or add new ones.

### Add Language Support

1. Add LSP server to `ensure_installed` in [lua/whoamihealay/lazy/mason.lua](lua/whoamihealay/lazy/mason.lua)
2. LSP server will be installed automatically on next startup

### Custom Keybindings

Add keybindings in [lua/whoamihealay/remap.lua](lua/whoamihealay/remap.lua)

### Editor Settings

Modify options in [lua/whoamihealay/set.lua](lua/whoamihealay/set.lua)

## Troubleshooting

### LSP server not installing

Run `:Mason` and manually install required servers, or check that the server name is correct in mason.lua.

### Performance issues

- Use `:Lazy` to check plugin load times
- Disable unused plugins in their respective configuration files
- Check `:checkhealth` for any warnings

### Missing colors in terminal

Ensure your terminal supports 24-bit true color (set `COLORTERM=truecolor`)

## Influences

- [ThePrimeagen/init.lua](https://github.com/ThePrimeagen/init.lua)
- [LazyVim](https://github.com/LazyVim/LazyVim)
