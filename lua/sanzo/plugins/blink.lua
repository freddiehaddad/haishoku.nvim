-- ----------------------------------------------------------------------------
-- Sanzo: blink.cmp
-- ----------------------------------------------------------------------------

return function(p)
    local h = {}
    local function set(list, o) for _, g in ipairs(list) do h[g] = o end end

    -- windows & borders
    h.BlinkCmpMenu                         = { link = "Pmenu" }
    h.BlinkCmpMenuSelection                = { bg = p.sel, bold = true }
    h.BlinkCmpScrollBarThumb               = { link = "PmenuThumb" }
    h.BlinkCmpScrollBarGutter              = { link = "PmenuSbar" }
    h.BlinkCmpDocCursorLine                = { link = "CursorLine" }
    h.BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" }
    h.BlinkCmpGhostText                    = { fg = p.grey }

    set({
        "BlinkCmpDoc",
        "BlinkCmpSignatureHelp",
    }, { link = "NormalFloat" })

    set({
        "BlinkCmpMenuBorder",
        "BlinkCmpDocBorder",
        "BlinkCmpDocSeparator",
        "BlinkCmpSignatureHelpBorder",
    }, { link = "FloatBorder" })

    -- labels & metadata
    h.BlinkCmpLabel           = { fg = p.fg }
    h.BlinkCmpLabelMatch      = { fg = p.role_fn, bold = true }
    h.BlinkCmpLabelDetail     = { fg = p.grey }
    h.BlinkCmpLabelDescription = { fg = p.role_comment }
    h.BlinkCmpLabelDeprecated = { fg = p.grey, strikethrough = true }
    h.BlinkCmpSource          = { fg = p.grey_ui }

    -- completion item kinds
    set({
        "BlinkCmpKindFunction",
        "BlinkCmpKindMethod",
        "BlinkCmpKindConstructor",
        "BlinkCmpKindFolder",
    }, { fg = p.role_fn })

    set({
        "BlinkCmpKindClass",
        "BlinkCmpKindInterface",
        "BlinkCmpKindStruct",
        "BlinkCmpKindEnum",
        "BlinkCmpKindTypeParameter",
    }, { fg = p.role_type })

    h.BlinkCmpKindUnit = { fg = p.role_builtin }

    set({
        "BlinkCmpKind",
        "BlinkCmpKindModule",
        "BlinkCmpKindSnippet",
        "BlinkCmpKindReference",
    }, { fg = p.role_def })

    set({
        "BlinkCmpKindConstant",
        "BlinkCmpKindEnumMember",
        "BlinkCmpKindValue",
        "BlinkCmpKindColor",
        "BlinkCmpKindEvent",
    }, { fg = p.role_const })

    h.BlinkCmpKindKeyword  = { fg = p.role_keyword }
    h.BlinkCmpKindOperator = { fg = p.role_op }
    h.BlinkCmpKindText     = { fg = p.role_string }
    h.BlinkCmpKindVariable = { fg = p.var }

    set({
        "BlinkCmpKindField",
        "BlinkCmpKindProperty",
        "BlinkCmpKindFile",
    }, { fg = p.fg })

    return h
end
