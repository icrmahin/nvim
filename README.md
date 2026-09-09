
# Neovim setup for beginners

This config turns Neovim into a friendly coding environment with a modern UI, smart search, file explorer, terminal, LSP support, and a few quality-of-life shortcuts.

It is built on top of LazyVim and then customized with extra plugins and keymaps for a smoother daily workflow.

## What this setup gives you

- A polished startup screen and status line
- Fast file search and project search
- A built-in file explorer
- LSP support for code navigation, hover, and actions
- A terminal you can open from inside Neovim
- Easy code running for many languages
- Helpful shortcuts for buffers, windows, comments, and search

---

## Requirements

Make sure you have:

- Neovim installed
- Git installed
- A terminal that supports modern keybindings (Kitty is a good match)
- Optional but helpful:
    - ripgrep for fast text search
    - yazi for the built-in file manager shortcut
    - language tools such as Python, Node, Go, GCC, and others depending on what you code

---

## Install it

If you want to use this config as your main Neovim setup, run:

```bash
# Back up any old config first
mv ~/.config/nvim ~/.config/nvim.bak

# Clone the config
git clone https://github.com/icrmahin/nvim ~/.config/nvim

# Start Neovim
nvim
```

On first launch, Lazy.nvim will install the plugins automatically.

---

## First launch checklist

When Neovim opens:

1. Wait for plugins to finish installing.
2. Run `:checkhealth` to confirm the setup is healthy.
3. Run `:Lazy` if you want to manage plugins.
4. Run `:Mason` if you want to install language servers, formatters, or linters.

If you use Python and want to point Neovim to a specific interpreter, set:

```bash
export NVIM_PYTHON_PATH="$(pyenv which python || which python3)"
```

---

## The basics

### 1. The leader key

This setup uses the Space key as the leader key.

That means many commands start with:

```text
<Space> ...
```

Examples:

- `<Space>ff` → find files
- `<Space>fg` → search text in the project
- `<Space>e` → open the file explorer
- `<Space>y` → open the Yazi file manager

### 2. Normal mode navigation

The basic movement keys are still the same:

- `h` left
- `j` down
- `k` up
- `l` right

Useful editing basics:

- `i` enter insert mode
- `Esc` leave insert mode
- `v` enter visual mode
- `yy` copy a line
- `dd` delete a line
- `p` paste

### 3. Window management

You can split windows and move between them:

- `<C-w> v` → split vertically
- `<C-w> s` → split horizontally
- `<C-w> c` → close a window
- `<C-w> w` → switch windows

This config also adds:

- `<Leader>\` → smart split: vertical or horizontal based on the current window shape
- `<Leader>-` → split the window below and balance the layout

---

## Buffer and tab workflow

This setup uses a buffer-based workflow, which means you can keep many files open without leaving Neovim.

Useful shortcuts:

- `Tab` → next buffer
- `Shift-Tab` → previous buffer
- `Alt-1` to `Alt-9` → jump directly to a buffer
- `Alt-c` → close the current buffer
- `Alt-Shift-c` → force close the current buffer
- `<Leader>bn` → open a new empty buffer

---

## Search and file navigation

### Find files and text

- `<Leader>ff` → find files
- `<Leader>fg` → search text across the project
- `<Leader>fr` → recent files
- `<Leader>f/` → find text in the current buffer
- `<Leader>fp` → open project picker
- `<Leader>fP` → browse plugin files
- `<Leader>fw` → search words in all files (requires ripgrep)

### File explorer

- `<Leader>e` → open the file explorer
- `<Leader>et` → toggle the filesystem view in Neo-tree
- `<Leader>eb` → toggle the buffers view in Neo-tree
- `<Leader>eg` → toggle the git status view in Neo-tree
- Press the same shortcut again to close the currently open Neo-tree view
    - `Y` copies a file path in several formats

---

## LSP and coding helpers

Once you open a supported file, Neovim will try to attach language servers automatically.

### Code navigation

- `gd` → go to definition
- `gr` → show references
- `gI` → go to implementation
- `gy` → go to type definition
- `gD` → go to declaration
- `gh` → hover information
- `gm` → open the man page for symbols when available
- `gP` → close preview windows

### Code actions

- `<Leader>ca` → show code actions
- `<Leader>cA` → show source actions

### Comments

- `<Leader>/` → toggle comments on the current line or selection

### Go helper

If you write Go code, this shortcut is handy:

- `<Leader>ce` → insert `if err != nil` boilerplate

---

## Completion and snippets

Completion is enabled with blink.cmp.

Useful keys:

- `Tab` → move to the next completion item
- `Shift-Tab` → move to the previous one
- `Enter` → accept the selected completion
- `Ctrl-j` and `Ctrl-k` → alternate navigation keys

This makes coding feel more like an IDE than a bare editor.

---

## Running code

This config includes a code runner for many languages.

Helpful shortcuts:

- `<Leader>rr` → run the current code
- `<Leader>rf` → run the current file
- `<Leader>ra` → run with custom arguments
- `<Leader>rp` → run the project
- `<Leader>rP` → configure project run settings
- `<Leader>rm...` → choose the output mode (terminal, floating window, tab, etc.)

The runner supports common languages such as Python, JavaScript, TypeScript, Go, Rust, C, C++, Lua, Shell, and more.

---

## Terminal and file manager

### Terminal

- `Alt-z` → open or close the floating terminal

This is useful for running commands without leaving the editor.

### Yazi file manager

- `<Leader>y` → open Yazi inside a floating terminal

If you do not have Yazi installed, the shortcut will not work until you install it.

---

## Saving, quitting, and quick actions

Useful shortcuts:

- `<Leader>W` → save without formatting
- `<C-c>` → copy the entire buffer to the clipboard
- `<C-x>` → cut the current buffer contents to the clipboard
- `<C-q>` → quit Neovim
- `<Leader>qq` → close the current window
- `<Leader>qQ` → quit all

---

## Helpful commands for maintenance

Use these when you want to keep the setup healthy:

```vim
:Lazy
:Mason
:checkhealth
```

You can also update plugins with:

```vim
:Lazy sync
```

---

## Quick cheat sheet

| Action                  | Shortcut     |
| ----------------------- | ------------ |
| Open file explorer      | `<Leader>e`  |
| Find files              | `<Leader>ff` |
| Search text in project  | `<Leader>fg` |
| Search current buffer   | `<Leader>f/` |
| Open terminal           | `Alt-z`      |
| Open Yazi               | `<Leader>y`  |
| Toggle comments         | `<Leader>/`  |
| Save without formatting | `<Leader>W`  |
| Close buffer            | `Alt-c`      |
| Next buffer             | `Tab`        |
| Previous buffer         | `Shift-Tab`  |
| Run code                | `<Leader>rr` |
| Run with args           | `<Leader>ra` |
| Show code actions       | `<Leader>ca` |
| Go to definition        | `gd`         |
| Show references         | `gr`         |
| Hover                   | `gh`         |

---

## Tips for beginners

- Start by learning the leader key first: almost everything important starts with `<Space>`.
- Use the file explorer and fuzzy finder before you try to remember every command.
- If you are new to Vim, spend a little time with `hjkl` movement and normal-mode editing.
- Keep `:checkhealth` and `:Lazy` in your toolbox whenever something feels off.

If you want, the next step is simply to open a file, try a few of the shortcuts above, and let the editor become familiar.

