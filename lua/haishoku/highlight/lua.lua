-- ----------------------------------------------------------------------------
-- Haishoku: Lua / LuaLS  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    ["@constant.lua"]                              = "HaishokuConstant",
    ["@constant.builtin.lua"]                      = "HaishokuConstant",
    ["@variable.builtin.lua"]                      = "HaishokuParameter",
    ["@variable.parameter.builtin.lua"]            = "HaishokuParameter",
    ["@module.builtin.lua"]                        = "HaishokuDefine",
    ["@constructor.lua"]                           = "HaishokuPunct",
    ["@label.lua"]                                 = "HaishokuControl",
    ["@attribute.lua"]                             = "HaishokuKeyword",
    ["@keyword.operator.lua"]                      = "HaishokuOperator",

    -- Keep Tree-sitter's keyword / control flow / return distinction.
    ["@lsp.type.keyword.lua"]                      = {},
    ["@lsp.typemod.keyword.readonly.lua"]           = "HaishokuConstant",
    ["@lsp.typemod.keyword.documentation.lua"]      = "HaishokuDefine",

    -- LuaLS reports self, constants and library globals as variables.
    ["@lsp.typemod.variable.definition.lua"]        = "HaishokuParameter",
    ["@lsp.typemod.variable.readonly.lua"]          = "HaishokuConstant",

    -- LuaLS does not supply provenance for table methods or local aliases.
    ["@lsp.typemod.variable.defaultLibrary.lua"]    = "HaishokuDefine",
    ["@lsp.typemod.function.defaultLibrary.lua"]    = "HaishokuFunctionLib",
    ["@lsp.typemod.method.defaultLibrary.lua"]      = "HaishokuFunctionLib",
    ["@lsp.typemod.type.defaultLibrary.lua"]        = "HaishokuBuiltin",
    ["@lsp.typemod.class.defaultLibrary.lua"]       = "HaishokuBuiltin",

    -- LuaLS uses these token types for labels, attributes and type aliases.
    ["@lsp.type.struct.lua"]                       = "HaishokuControl",
    ["@lsp.type.typeParameter.lua"]                = "HaishokuKeyword",
    ["@lsp.type.macro.lua"]                        = "HaishokuType",
}
