local M       = {}

local bg      = "#2B2A2A"
local sel     = "#404040"
local vis     = "#4d4d4d"

local bone    = {
    var   = "#e8e8d3",
    fg    = "#e8e8d3",
    param = "#d7d7c6",
}

local grey    = {
    op      = "#bcbcb2",
    punct   = "#acaca2",
    comment = "#7a7a7a",
    ui      = "#6f6f6b",
    line    = "#5a5a5a",
    dim     = "#3a3a3a",
}

local accent  = {
    fn      = "#dcbd93",
    type    = "#93a5a0",
    string  = "#a8bcac",
    const   = "#cca598",
    keyword = "#b3a6b0",
}

local sibling = {
    fn_lib  = "#cebfa1",
    builtin = "#859099",
    def     = "#a8b0b8",
    ret     = "#cc9a98",
    kw_ctrl = "#9e8f9c",
}

function M.get() -- palette
    local p        = {}
    p.bg           = bg
    p.sel          = sel
    p.vis          = vis

    p.fg           = bone.fg
    p.var          = bone.var
    p.param        = bone.param

    p.role_op      = grey.op
    p.role_punct   = grey.punct
    p.comment_grey = grey.comment
    p.grey         = grey.ui
    p.grey_ui      = grey.line
    p.grey_dim     = grey.dim
    p.punc_grey    = grey.punct
    p.role_comment = grey.comment

    for role, hex in pairs(accent) do p["role_" .. role] = hex end
    for name, hex in pairs(sibling) do p["role_" .. name] = hex end

    return p
end

return M
