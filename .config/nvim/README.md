# Neovim "IDE" Configuration

This is a complete Neovim configuration designed to work as a modern IDE for any programming language. It is built on `lazy.nvim` for plugin management and uses a modular structure for easy maintenance.

## File Structure

The configuration is organized as follows:

- `init.lua`: Main entry point.
- `lua/core/`: Base Neovim settings.
  - `options.lua`: Global editor options.
  - `keymaps.lua`: Global keyboard shortcuts.
  - `lazy.lua`: `lazy.nvim` installation and setup.
- `lua/plugins/`: Plugin configuration files, grouped by functionality.
  - `ui.lua`: User interface plugins (theme, icons, statusline, etc.).
  - `lsp.lua`: LSP, formatting, and debugging (DAP).
  - `completion.lua`: Autocomplete and snippets.
  - `git.lua`: Git integration.
  - `telescope.lua`: Fuzzy finder.
  - `treesitter.lua`: Syntax highlighting and text objects.
  - `tools.lua`: Other productivity tools.

## Main Features

- **Plugin Manager**: `lazy.nvim` for fast, on-demand loading.
- **Full IDE Experience**:
  - LSP support for dozens of languages via `mason.nvim`.
  - Autocomplete with `nvim-cmp`.
  - Code formatting on save with `conform.nvim`.
  - Integrated debugging with `nvim-dap` and `nvim-dap-ui`.
- **Modern UI**:
  - `tokyonight` theme.
  - Welcome dashboard with `alpha-nvim`.
  - Statusline with `lualine.nvim` and tabs with `bufferline.nvim`.
  - File explorer with `neo-tree.nvim`.
  - Pop-up keymap guide with `which-key.nvim`.
- **Efficient Searching**: `telescope.nvim` for fuzzy searching files, text, buffers, and more.
- **Productivity**:
  - Full Git integration with `gitsigns`, `fugitive`, `lazygit`, and `diffview`.
  - Fast navigation with `harpoon` and `flash.nvim`.
  - Floating terminal with `toggleterm.nvim`.
  - Smart commenting with `Comment.nvim`, aware of the language context through `Treesitter`.

---

## Keymaps (`<leader>` is the `Space` key)

### General and Window Management

| Shortcut | Action |
|---|---|
| `jk` | Exit insert mode |
| `<leader>nh` | Clear search highlight |
| `<leader>sv` | Create a vertical split |
| `<leader>sh` | Create a horizontal split |
| `<leader>sx` | Close the current split |
| `<leader>sm` | Maximize the current split |
| `<C-h/j/k/l>` | Navigate between Vim splits and Tmux panes |

### Telescope (Fuzzy Finder)

| Shortcut | Action |
|---|---|
| `<leader>ff` | Find files in the project |
| `<leader>fs` | Live grep for text |
| `<leader>fr` | Open recent files |
| `<leader>fb` | List and search open buffers |
| `<leader>fc` | Search for the word under the cursor |
| `<leader>fh` | Search for Vim help tags |

### LSP (Language Server Protocol)

| Shortcut | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `K` | Show documentation (hover) |
| `gr` | Show references |
| `<leader>ca` | View and apply Code Actions |
| `<leader>rn` | Rename symbol |
| `<leader>e` | Show diagnostics (errors/warnings) |
| `[d` / `]d` | Navigate to the previous/next diagnostic |

### Debugging (DAP)

| Shortcut | Action |
|---|---|
| `<leader>db` | Add/Remove Breakpoint |
| `<leader>dc` | Start/Continue debugging |
| `<leader>di` | Step Into function |
| `<leader>do` | Step Over |
| `<leader>dO` | Step Out of function |
| `<leader>dr` | Open the debugger REPL |
| `<leader>dt` | Terminate debug session |
| `<leader>dui` | Show/Hide DAP UI |

### Git

| Shortcut | Action |
|---|---|
| `<leader>gs` | View Git status (`fugitive`) |
| `<leader>lg` | Open `lazygit` (TUI interface) |
| `<leader>gp` | Preview hunk (gitsigns) |
| `<leader>gb` | View blame for the current line (gitsigns) |
| `]c` / `[c` | Go to the next/previous hunk |
| `<leader>do` | Open Diffview to see changes |
| `<leader>dh` | View file history in Diffview |

### Productivity Tools

| Shortcut | Action |
|---|---|
| `<leader>e` | Open/Close file explorer (`neo-tree`) |
| `s` / `S` | Jump anywhere on the screen (`flash.nvim`) |
| `<leader>a` | Mark file in `harpoon` |
| `<C-e>` | Open `harpoon` menu |
| `<leader>1..4` | Jump to harpoon files 1 to 4 |
| `<leader>sr` | Search and replace in the entire project (`spectre`) |
| `<C-\>` | Open/Close floating terminal |
| `<leader>z` | Enter/Exit Zen mode (total focus) |

### Comments

| Shortcut | Action |
|---|---|
| `gc` | Toggle comment for the current line (normal mode) or selection (visual mode). Uses the correct comment style for the file type. |