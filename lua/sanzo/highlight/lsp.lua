-- ----------------------------------------------------------------------------
-- Sanzo: lsp semantic tokens
-- ----------------------------------------------------------------------------

return {
    ["@lsp.type.variable"]      = "SanzoVariable",
    ["@lsp.type.parameter"]     = "SanzoParameter",
    ["@lsp.type.property"]      = "SanzoField",
    ["@lsp.type.field"]         = "SanzoField",

    ["@lsp.type.function"]      = "SanzoFunction",
    ["@lsp.type.method"]        = "SanzoFunction",

    ["@lsp.type.class"]         = "SanzoType",
    ["@lsp.type.type"]          = "SanzoType",
    ["@lsp.type.enum"]          = "SanzoType",
    ["@lsp.type.struct"]        = "SanzoType",
    ["@lsp.type.interface"]     = "SanzoType",
    ["@lsp.type.typeParameter"] = "SanzoType",
    ["@lsp.type.builtinType"]   = "SanzoBuiltin",

    ["@lsp.type.enumMember"]    = "SanzoConstant",
    ["@lsp.type.const"]         = "SanzoBuiltin",
    ["@lsp.type.number"]        = "SanzoConstant",
    ["@lsp.type.string"]        = "SanzoString",

    ["@lsp.type.keyword"]       = "SanzoKeyword",
    ["@lsp.type.modifier"]      = "SanzoKeyword",
    ["@lsp.type.operator"]      = "SanzoOperator",

    ["@lsp.type.namespace"]     = "SanzoDefine",
    ["@lsp.type.macro"]         = "SanzoDefine",
    ["@lsp.type.decorator"]     = "SanzoDefine",

    ["@lsp.type.comment"]       = "SanzoComment",
    ["@lsp.type.selfKeyword"]   = "SanzoBuiltin",
}
