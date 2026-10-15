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

    h.TelescopePromptTitle    = { fg = p.punc_grey, bg = "NONE" }
    h.TelescopeResultsTitle   = { fg = p.role_def, bg = "NONE" }
    h.TelescopePreviewTitle   = { fg = p.role_keyword, bg = "NONE" }
    h.TelescopePromptPrefix   = { fg = p.role_fn, bg = "NONE" }
    h.TelescopePromptCounter  = { fg = p.role_fn, bg = "NONE" }
    h.TelescopeSelection      = { fg = p.role_fn, bg = "NONE", bold = true }
    h.TelescopeSelectionCaret = { fg = p.role_fn, bg = "NONE" }
    h.TelescopeMatching       = { fg = p.role_fn, bold = true }
    h.TelescopeResultsLineNr  = { fg = p.grey_ui }

    return h
end
