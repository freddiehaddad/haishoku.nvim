-- ----------------------------------------------------------------------------
-- Sanzo: mason
-- ----------------------------------------------------------------------------

return function(p)
    local h = {}
    local function set(list, o) for _, g in ipairs(list) do h[g] = o end end

    set({
        "MasonHeader",
        "MasonHeaderSecondary"
    }, { fg = p.role_fn, bg = "NONE", bold = true })

    set({
        "MasonHighlight",
        "MasonHighlightSecondary"
    }, { fg = p.role_def })

    set({
        "MasonHighlightBlock",
        "MasonHighlightBlockBold",
        "MasonHighlightBlockSecondary",
        "MasonHighlightBlockBoldSecondary"
    }, { fg = p.role_def, bg = "NONE" })

    set({
        "MasonMuted",
        "MasonMutedBlock",
        "MasonMutedBlockBold"
    }, { fg = p.grey, bg = "NONE" })

    h.MasonError   = { fg = p.role_const }
    h.MasonWarning = { fg = p.role_fn }
    h.MasonHeading = { fg = p.fg }
    h.MasonLink    = { fg = p.role_def, underline = true }

    return h
end
