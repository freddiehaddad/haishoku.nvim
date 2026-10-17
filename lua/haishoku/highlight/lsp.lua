-- ----------------------------------------------------------------------------
-- Haishoku: lsp semantic tokens
-- ----------------------------------------------------------------------------

return {
    ["@lsp.type.variable"]      = "HaishokuVariable",
    ["@lsp.type.parameter"]     = "HaishokuParameter",
    ["@lsp.type.property"]      = "HaishokuField",
    ["@lsp.type.field"]         = "HaishokuField",

    ["@lsp.type.function"]      = "HaishokuFunction",
    ["@lsp.type.method"]        = "HaishokuFunction",

    ["@lsp.type.class"]         = "HaishokuType",
    ["@lsp.type.type"]          = "HaishokuType",
    ["@lsp.type.enum"]          = "HaishokuType",
    ["@lsp.type.struct"]        = "HaishokuType",
    ["@lsp.type.interface"]     = "HaishokuType",
    ["@lsp.type.typeParameter"] = "HaishokuType",
    ["@lsp.type.builtinType"]   = "HaishokuBuiltin",

    ["@lsp.type.enumMember"]    = "HaishokuConstant",
    ["@lsp.type.const"]         = "HaishokuBuiltin",
    ["@lsp.type.number"]        = "HaishokuConstant",
    ["@lsp.type.string"]        = "HaishokuString",

    ["@lsp.type.keyword"]       = "HaishokuKeyword",
    ["@lsp.type.modifier"]      = "HaishokuKeyword",
    ["@lsp.type.operator"]      = "HaishokuOperator",

    ["@lsp.type.namespace"]     = "HaishokuDefine",
    ["@lsp.type.macro"]         = "HaishokuDefine",
    ["@lsp.type.decorator"]     = "HaishokuDefine",

    ["@lsp.type.comment"]       = "HaishokuComment",
    ["@lsp.type.selfKeyword"]   = "HaishokuBuiltin",
}
