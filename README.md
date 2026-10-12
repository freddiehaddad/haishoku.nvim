<h1 align="center">sanzo</h1>

<p align="center">
    <img src="assets/sanzo_logo.webp" width="240" alt="Sanzo logo">
</p>

A quiet Neovim color scheme. Nothing hidden. Nothing generated.

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

palette.bg = "#1e1e2e"
palette.fg = "#cdd6f4"

-- Function: blue / sapphire
palette.role_fn = "#89b4fa"
palette.role_fn_lib = "#74c7ec"

-- Type: yellow / peach
palette.role_type = "#f9e2af"
palette.role_builtin = "#fab387"

-- String: green / teal
palette.role_string = "#a6e3a1"
palette.role_def = "#94e2d5"

-- Constant: red / maroon
palette.role_const = "#f38ba8"
palette.role_ret = "#eba0ac"

-- Keyword: mauve / lavender
palette.role_keyword = "#cba6f7"
palette.role_kw_ctrl = "#b4befe"

vim.cmd.colorscheme("sanzo")
```

Change both colors in a pair. Their kinship keeps the scheme coherent, their
difference keeps the code legible.

For a full repaint, edit `lua/sanzo/palette.lua`. The rest of the scheme reads
from it.
