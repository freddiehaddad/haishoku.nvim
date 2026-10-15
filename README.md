<p align="center">
    <img src="assets/sanzo_logo.webp" width="240" alt="Sanzo logo">
</p>
<h1 align="center">sanzo</h1>

<p align="center">
    A quiet Neovim color scheme. Accents and siblings distinguish syntax.<br>
    Inspired by Wada Sanzō.
</p>

<p align="center">
    <img
        src="https://culturecode.dev/posts/what-most-colorschemes-miss/sanzo_showcase.webp"
        width="860"
        alt="Sanzo color scheme in Neovim"
    >
</p>

## Install

```lua
vim.pack.add({
  "https://codeberg.org/navahas/sanzo.nvim",
})

vim.cmd.colorscheme("sanzo")
```

## Change the colors

Sanzo builds variety from pairs. Each accent has a nearby sibling:

```text
function  / library function
type      / builtin
string    / definition
constant  / return
keyword   / control flow
```
The palette is a plain Lua table. Change it before loading the scheme. Here is
[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) translated into
Sanzo's accent-and-sibling grammar:

```lua
local palette = require("sanzo.palette")

palette.bg = "#1a1b26"
palette.fg = "#c0caf5"

-- Function: warm yellow / soft gold
palette.role_fn = "#e0af68"
palette.role_fn_lib = "#c9ae83"

-- Type: blue / muted blue
palette.role_type = "#7aa2f7"
palette.role_builtin = "#89a7d8"

-- String: green / soft teal
palette.role_string = "#9ece6a"
palette.role_def = "#73daca"

-- Constant: pink-red / muted rose
palette.role_const = "#f7768e"
palette.role_ret = "#d88b9d"

-- Keyword: purple / muted lavender
palette.role_keyword = "#bb9af7"
palette.role_kw_ctrl = "#9d7cd8"

vim.cmd.colorscheme("sanzo")
```

Change both colors in a pair. Their kinship keeps the scheme coherent, their
difference keeps the code legible.

For a full repaint, edit `lua/sanzo/palette.lua`. The rest of the scheme reads
from it.
