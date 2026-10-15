local function brighten(color, foreground)
    local base = vim.api.nvim_get_color_by_name(color)
    local target = vim.api.nvim_get_color_by_name(foreground)
    assert(base >= 0, "sanzo: invalid terminal color: " .. color)
    assert(target >= 0, "sanzo: invalid terminal foreground: " .. foreground)

    local channels = {}
    for _, divisor in ipairs({ 0x10000, 0x100, 1 }) do
        local from = math.floor(base / divisor) % 0x100
        local to = math.floor(target / divisor) % 0x100
        channels[#channels + 1] = math.floor(from + (to - from) * 0.15 + 0.5)
    end
    return string.format("#%02x%02x%02x", unpack(channels))
end

return function(p)
    -- ANSI order: black, red, green, yellow, blue, magenta, cyan, white.
    return {
        [0]  = p.bg,
        [1]  = p.role_ret,
        [2]  = p.role_string,
        [3]  = p.role_fn_lib,
        [4]  = p.role_builtin,
        [5]  = p.role_kw_ctrl,
        [6]  = p.role_def,
        [7]  = p.param,

        [8]  = p.grey,
        [9]  = p.role_const,
        [10] = brighten(p.role_string, p.fg),
        [11] = p.role_fn,
        [12] = p.role_type,
        [13] = p.role_keyword,
        [14] = brighten(p.role_def, p.fg),
        [15] = p.fg,
    }
end
