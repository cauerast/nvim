# Neovim Config

A minimal, fast Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. It provides LSP, autocompletion, Treesitter highlighting, fuzzy finding, a file explorer, an integrated terminal, and the Oxocarbon theme.

## Requirements

- Neovim **0.11+** (uses `vim.lsp.config` / `vim.lsp.enable`)
- `git`
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- A C compiler (for Treesitter parsers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)
- Language servers you want to use (see [LSP](#lsp))

## Installation

```sh
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/cauerast/neovim.git ~/.config/nvim

# Start Neovim — lazy.nvim bootstraps itself and installs all plugins
nvim
```

## Structure

```
.
├── init.lua                 # General options, loads keymaps and lazy.nvim
├── lazy-lock.json           # Pinned plugin versions
└── lua
    ├── config
    │   ├── keymaps.lua      # Leader key and global keymaps
    │   └── lazy.lua         # lazy.nvim bootstrap and setup
    └── plugins
        ├── autocomplete.lua # nvim-cmp + LuaSnip
        ├── autopairs.lua    # nvim-autopairs
        ├── lsp.lua          # LSP servers and keymaps
        ├── neo-tree.lua     # File tree
        ├── oil.lua          # Edit the filesystem like a buffer
        ├── telescope.lua    # Fuzzy finder
        ├── theme.lua        # Oxocarbon colorscheme
        ├── toggleterm.lua   # Integrated terminal
        ├── treesitter.lua   # Syntax highlighting and indent
        └── ui.lua           # Statusline and bufferline
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (update checker enabled) |
| [oxocarbon.nvim](https://github.com/nyoom-engineering/oxocarbon.nvim) | Colorscheme |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) + LuaSnip | Autocompletion and snippets (LSP, snippets, path, buffer sources) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indentation |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Sidebar file explorer |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Filesystem editing in a buffer (handles directory opening) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal management |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets and quotes |

## General Settings

- Line numbers, `scrolloff`/`sidescrolloff` of 8, line wrapping on
- 2-space indentation with spaces (`expandtab`)
- Case-insensitive search with smart case, incremental search and highlighting
- System clipboard (`unnamedplus`) and mouse support enabled
- New splits open to the right and below
- True color with a dark background

## Keymaps

The leader key is `<Space>`; the local leader is `\`.

### General

| Key | Mode | Action |
| --- | --- | --- |
| `j` / `k` | Normal | Move by visual line (`gj` / `gk`) |
| `<C-h/j/k/l>` | Normal | Move between windows |
| `<Esc><Esc>` | Terminal | Exit to normal mode |
| `<C-h>` / `<C-k>` | Terminal | Jump to left / upper window |

### Files and Search

| Key | Action |
| --- | --- |
| `<leader>ff` | Telescope: find files |
| `<leader>fg` | Telescope: live grep |
| `<leader>e` | Toggle file tree (neo-tree) |
| `<leader>E` | Reveal current file in tree |

> When an LSP is attached, `<leader>e` is overridden in that buffer to show line diagnostics (see below).

### Buffers

| Key | Action |
| --- | --- |
| `<S-l>` / `<S-h>` | Next / previous buffer |
| `<leader>x` | Close buffer |

### Terminal

| Key | Action |
| --- | --- |
| `<C-\>` | Toggle terminal (horizontal) |
| `<leader>th` | Bottom terminal |
| `<leader>tf` | Floating terminal |

### LSP (active when a server attaches)

| Key | Action |
| --- | --- |
| `K` | Hover documentation |
| `gd` / `gD` | Go to definition / declaration |
| `gt` | Go to type definition |
| `gi` | Go to implementation |
| `<leader>fr` | List references (Telescope) |
| `<leader>r` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>df` / `<leader>dp` | Next / previous diagnostic |
| `<leader>dl` | List diagnostics (Telescope) |
| `<leader>e` | Show diagnostics for the current line |

### Completion (insert mode)

| Key | Action |
| --- | --- |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<C-b>` / `<C-f>` | Scroll documentation |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |

## LSP

Enabled servers: `clangd`, `gopls`, `pyright`, `ts_ls`, `jdtls`.

Install them separately (e.g. via your package manager, `npm`, `go install`, or `pip`). Servers that aren't installed are simply ignored, so remove any you don't need from `lua/plugins/lsp.lua`.

- `clangd` is configured with `--compile-commands-dir=build`, so generate `compile_commands.json` in a `build/` directory (e.g. `cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`).
- `jdtls` requires a working Java setup and may need extra configuration for your projects.

## Treesitter

Parsers installed automatically: `c`, `cpp`, `lua`, `vim`, `vimdoc`, `typescript`, `javascript`, `tsx`, `html`, `css`, `go`, `markdown`, `python`, `java`, `rust`. Highlighting is skipped for files larger than 100 KB.

## Customization

- Add a new plugin by creating a file in `lua/plugins/` that returns a lazy.nvim spec; it is imported automatically.
- Add a language server by including its name in `vim.lsp.enable({...})` in `lua/plugins/lsp.lua`.
- Change the colorscheme in `lua/plugins/theme.lua`.
