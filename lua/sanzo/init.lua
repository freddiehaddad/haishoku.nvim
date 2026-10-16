local M = {}

M.config = {
    transparent   = false,
    on_highlights = nil, -- function(h, p) mutate final table (wins last)
}

function M.setup(opts)
    M.config = vim.tbl_extend("force", M.config, opts or {})
end

function M.load()
    vim.cmd("highlight clear")
    if vim.g.syntax_on then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "sanzo"

    local cfg = M.config
    local p = require("sanzo.palette")

    local h = require("sanzo.groups")(p, cfg)

    -- auto-load every lua/sanzo/plugins/*.lua (drop a file = new plugin)
    for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/sanzo/plugins/*.lua", true)) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        for g, o in pairs(require("sanzo.plugins." .. name)(p)) do h[g] = o end
    end

    -- auto-load every lua/sanzo/highlight/*.lua (drop a file = new language)
    for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/sanzo/highlight/*.lua", true)) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        for group, target in pairs(require("sanzo.highlight." .. name)) do
            if h[group] == nil then
                h[group] = type(target) == "string" and { link = target } or target
            end
        end
    end

    if type(cfg.on_highlights) == "function" then cfg.on_highlights(h, p) end

    for group, opts in pairs(h) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    for index, color in pairs(require("sanzo.terminal")(p)) do
        vim.g["terminal_color_" .. index] = color
    end

    require("sanzo.semantic").setup()
end

return M
