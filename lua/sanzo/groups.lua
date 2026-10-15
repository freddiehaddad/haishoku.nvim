-- ----------------------------------------------------------------------------
-- Sanzo: single color file
-- (palette) -> { [group] = opts }
-- ----------------------------------------------------------------------------

return function(p, cfg)
    local h                       = {}
    local BG                      = cfg.transparent and "NONE" or p.bg
    local FLOAT_BG                = cfg.transparent and "NONE" or p.bg_float

    h.SanzoFunction               = { fg = p.role_fn }
    h.SanzoFunctionLib            = { fg = p.role_fn_lib }
    h.SanzoType                   = { fg = p.role_type }
    h.SanzoBuiltin                = { fg = p.role_builtin }
    h.SanzoDefine                 = { fg = p.role_def }
    h.SanzoKeyword                = { fg = p.role_keyword }
    h.SanzoControl                = { fg = p.role_kw_ctrl }
    h.SanzoString                 = { fg = p.role_string }
    h.SanzoConstant               = { fg = p.role_const }
    h.SanzoReturn                 = { fg = p.role_ret }
    h.SanzoOperator               = { fg = p.role_op }
    h.SanzoPunct                  = { fg = p.role_punct }
    h.SanzoComment                = { fg = p.role_comment, italic = true }
    h.SanzoVariable               = { fg = p.var }
    h.SanzoParameter              = { fg = p.param }
    h.SanzoField                  = { fg = p.fg }

    -- ---- editor chrome -----------------------------------------------------
    h.Normal                      = { fg = p.fg, bg = BG }
    h.NormalNC                    = { fg = p.fg, bg = BG }
    h.NormalFloat                 = { fg = p.fg, bg = FLOAT_BG }
    h.FloatBorder                 = { fg = p.role_punct, bg = FLOAT_BG }
    h.FloatTitle                  = { fg = p.fg, bg = FLOAT_BG }
    h.FloatFooter                 = { link = "FloatTitle" }
    h.SignColumn                  = { bg = BG }
    h.FoldColumn                  = { bg = BG }
    h.MsgArea                     = { bg = BG }
    h.EndOfBuffer                 = { fg = p.grey_ui, bg = BG }
    h.ColorColumn                 = { bg = "NONE" }
    h.CursorLine                  = { bg = "NONE" }
    h.CursorColumn                = { bg = "NONE" }
    h.Cursor                      = { fg = p.bg, bg = p.fg }
    h.LineNr                      = { fg = p.grey_ui, bg = BG }
    h.LineNrAbove                 = { fg = p.grey_ui, bg = BG }
    h.LineNrBelow                 = { fg = p.grey_ui, bg = BG }
    h.CursorLineNr                = { fg = p.fg, bg = BG }
    h.Visual                      = { bg = p.vis }
    h.VisualNOS                   = { bg = p.vis }
    h.Search                      = { fg = p.bg, bg = p.role_string }
    h.IncSearch                   = { fg = p.bg, bg = p.role_fn }
    h.CurSearch                   = { fg = p.bg, bg = p.role_fn }
    h.MatchParen                  = { fg = p.role_fn, bold = true }
    h.WinSeparator                = { fg = p.role_punct, bg = BG }
    h.VertSplit                   = { fg = p.role_punct, bg = BG }
    h.NonText                     = { fg = p.grey_dim }
    h.Whitespace                  = { fg = p.grey_dim }
    h.SpecialKey                  = { fg = p.grey_dim }
    h.Directory                   = { fg = p.role_fn }
    h.Title                       = { fg = p.role_fn, bold = true }
    h.Folded                      = { fg = p.grey, italic = true, bg = "NONE" }
    h.Conceal                     = { fg = p.grey }
    h.WinBar                      = { fg = p.fg, bg = BG }
    h.WinBarNC                    = { fg = p.grey, bg = BG }
    h.QuickFixLine                = { bg = p.sel }
    h.StatusLine                  = { fg = p.grey_ui, bg = "NONE" }
    h.StatusLineNC                = { fg = p.grey_dim, bg = "NONE" }

    -- ---- messages ----------------------------------------------------------
    h.ModeMsg                     = { fg = p.role_fn, bold = true }
    h.MoreMsg                     = { fg = p.role_string }
    h.Question                    = { fg = p.role_string }
    h.ErrorMsg                    = { fg = p.role_const, bold = true }
    h.WarningMsg                  = { fg = p.role_fn }
    h.MsgSeparator                = { fg = p.grey, bg = "NONE" }

    -- ---- popup menu --------------------------------------------------------
    h.Pmenu                       = { fg = p.fg, bg = FLOAT_BG }
    h.PmenuSel                    = { fg = p.role_fn, bg = p.sel, bold = true }
    h.PmenuSbar                   = { bg = FLOAT_BG }
    h.PmenuThumb                  = { bg = p.grey }
    h.PmenuKind                   = { fg = p.role_def, bg = FLOAT_BG }
    h.PmenuKindSel                = { fg = p.role_def, bg = p.sel, bold = true }
    h.PmenuExtra                  = { fg = p.grey, bg = FLOAT_BG }
    h.PmenuBorder                 = { link = "FloatBorder" }
    h.WildMenu                    = { fg = p.role_fn, bg = p.sel }

    -- ---- tabline -----------------------------------------------------------
    h.TabLine                     = { fg = p.grey, bg = BG }
    h.TabLineSel                  = { fg = p.role_keyword, bg = BG, bold = true }
    h.TabLineFill                 = { fg = p.grey, bg = BG }

    -- ---- markup ------------------------------------------------------------
    h.Underlined                  = { fg = p.role_def, underline = true }
    h.Todo                        = { fg = p.bg, bg = p.role_fn, bold = true }
    h["@markup.heading"]          = { fg = p.role_fn, bold = true }
    h["@markup.link"]             = { fg = p.role_def, underline = true }
    h["@markup.link.url"]         = { fg = p.grey, underline = true }
    h["@markup.strong"]           = { bold = true }
    h["@markup.italic"]           = { italic = true }

    -- ---- lsp references / inlay hints --------------------------------------
    h.LspInlayHint                = { fg = p.grey, bg = "NONE" }
    h.LspSignatureActiveParameter = { fg = p.role_keyword, bold = true }
    h.LspReferenceText            = { bg = p.sel }
    h.LspReferenceRead            = { bg = p.sel }
    h.LspReferenceWrite           = { bg = p.sel }

    -- ---- diagnostics -------------------------------------------------------
    local dcol                    = {
        Error = p.role_const,
        Warn  = p.role_fn,
        Info  = p.role_def,
        Hint  = p.grey,
        Ok    = p.role_string,
    }
    for sev, c in pairs(dcol) do
        h["Diagnostic" .. sev]            = { fg = c }
        h["DiagnosticVirtualText" .. sev] = { fg = c }
        h["DiagnosticFloating" .. sev]    = { fg = c, bg = FLOAT_BG }
        h["DiagnosticSign" .. sev]        = { fg = c, bg = BG }
        h["DiagnosticUnderline" .. sev]   = { undercurl = true, sp = c }
    end

    -- ---- git / diff --------------------------------------------------------
    h.DiffAdd    = { fg = p.role_string, bg = "NONE" }
    h.DiffChange = { fg = p.role_def, bg = "NONE" }
    h.DiffDelete = { fg = p.role_const, bg = "NONE" }
    h.DiffText   = { fg = p.role_fn, bg = "NONE" }
    h.Added      = { fg = p.role_string }
    h.Changed    = { fg = p.role_def }
    h.Removed    = { fg = p.role_const }

    -- ---- builtins bundled with nvim (spell = core, netrw = bundled plugin) --
    h.SpellBad   = { undercurl = true, sp = p.role_const }
    h.SpellCap   = { undercurl = true, sp = p.role_fn }
    h.SpellRare  = { undercurl = true, sp = p.role_keyword }
    h.SpellLocal = { undercurl = true, sp = p.role_def }
    h.netrwDir   = { fg = p.role_fn, bold = true }

    return h
end
