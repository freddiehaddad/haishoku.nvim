-- ----------------------------------------------------------------------------
-- Sanzo: telescope
-- ----------------------------------------------------------------------------

return function(p)
    local h = {}
    local function set(list, o) for _, g in ipairs(list) do h[g] = o end end

    set({
        "TelescopeNormal",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal"
    }, { link = "NormalFloat" })

    set({
        "TelescopePromptBorder",
        "TelescopeResultsBorder",
        "TelescopePreviewBorder",
        "TelescopeBorder"
    }, { link = "FloatBorder" })

    set({
        "TelescopeTitle",
        "TelescopePromptTitle",
        "TelescopeResultsTitle",
        "TelescopePreviewTitle",
    }, { link = "FloatTitle" })

    -- prompt
    h.TelescopePromptPrefix   = { fg = p.role_fn }
    h.TelescopePromptCounter  = { fg = p.grey }

    -- selection & matching
    h.TelescopeSelection      = { bg = p.sel, bold = true }
    h.TelescopeSelectionCaret = { fg = p.role_fn, bg = p.sel, bold = true }
    h.TelescopeMultiSelection = { bold = true }
    h.TelescopeMultiIcon      = { fg = p.role_fn, bold = true }
    h.TelescopeMatching       = { fg = p.role_fn, bold = true }

    -- preview
    h.TelescopePreviewLine    = { link = "CursorLine" }
    h.TelescopePreviewMatch   = { link = "Search" }
    h.TelescopePreviewLink    = { fg = p.role_def }
    h.TelescopePreviewRead    = { fg = p.role_string }
    h.TelescopePreviewWrite   = { fg = p.role_keyword }
    h.TelescopePreviewExecute = { fg = p.role_fn }
    h.TelescopePreviewHyphen  = { fg = p.grey_ui }
    h.TelescopePreviewUser    = { fg = p.fg }
    h.TelescopePreviewGroup   = { fg = p.param }

    set({
        "TelescopePreviewPipe",
        "TelescopePreviewCharDev",
        "TelescopePreviewBlock",
        "TelescopePreviewSocket",
    }, { fg = p.role_builtin })

    set({
        "TelescopePreviewSize",
        "TelescopePreviewDate",
    }, { fg = p.role_const })

    -- results
    set({
        "TelescopeResultsClass",
        "TelescopeResultsStruct",
    }, { fg = p.role_type })

    set({
        "TelescopeResultsFunction",
        "TelescopeResultsMethod",
    }, { fg = p.role_fn })

    set({
        "TelescopeResultsConstant",
        "TelescopeResultsNumber",
    }, { fg = p.role_const })

    set({
        "TelescopeResultsField",
        "TelescopeResultsIdentifier",
    }, { fg = p.fg })

    h.TelescopeResultsVariable      = { fg = p.var }
    h.TelescopeResultsOperator      = { fg = p.role_op }
    h.TelescopeResultsLineNr        = { fg = p.grey_ui }
    h.TelescopeResultsDiffUntracked = { fg = p.grey }

    set({
        "TelescopeResultsComment",
        "TelescopeResultsSpecialComment",
    }, { fg = p.role_comment })

    return h
end
