-- ----------------------------------------------------------------------------
-- Sanzo: mini.starter
-- ----------------------------------------------------------------------------

return function(p)
    return {
        MiniStarterHeader     = { fg = p.role_type },
        MiniStarterSection    = { fg = p.role_def, bold = true },
        MiniStarterItem       = { fg = p.param },
        MiniStarterCurrent    = { fg = p.fg, bold = true },
        MiniStarterItemBullet = { fg = p.grey_ui },
        MiniStarterItemPrefix = { fg = p.role_fn, bold = true },
        MiniStarterQuery      = { fg = p.role_string, bold = true },
        MiniStarterInactive   = { fg = p.grey },
        MiniStarterFooter     = { fg = p.grey },
    }
end
