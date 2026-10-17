-- ----------------------------------------------------------------------------
-- Haishoku: mini.statusline
-- ----------------------------------------------------------------------------

return function(p)
    return {
        MiniStatuslineModeNormal  = { fg = p.role_type, bg = "NONE", bold = true },
        MiniStatuslineModeInsert  = { fg = p.role_string, bg = "NONE", bold = true },
        MiniStatuslineModeVisual  = { fg = p.role_keyword, bg = "NONE", bold = true },
        MiniStatuslineModeReplace = { fg = p.role_const, bg = "NONE", bold = true },
        MiniStatuslineModeCommand = { fg = p.role_fn, bg = "NONE", bold = true },
        MiniStatuslineModeOther   = { fg = p.role_builtin, bg = "NONE", bold = true },

        MiniStatuslineDevinfo     = { fg = p.role_def, bg = "NONE" },
        MiniStatuslineFilename    = { fg = p.fg, bg = "NONE" },
        MiniStatuslineFileinfo    = { fg = p.role_comment, bg = "NONE" },
        MiniStatuslineInactive    = { fg = p.grey_ui, bg = "NONE" },
    }
end
