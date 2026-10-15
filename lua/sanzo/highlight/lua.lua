-- ----------------------------------------------------------------------------
-- Sanzo: Lua / LuaLS  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    ["@constant.lua"]                              = "SanzoConstant",
    ["@constant.builtin.lua"]                      = "SanzoConstant",
    ["@variable.builtin.lua"]                      = "SanzoParameter",
    ["@variable.parameter.builtin.lua"]            = "SanzoParameter",
    ["@module.builtin.lua"]                        = "SanzoDefine",
    ["@constructor.lua"]                           = "SanzoPunct",
    ["@label.lua"]                                 = "SanzoControl",
    ["@attribute.lua"]                             = "SanzoKeyword",
    ["@keyword.operator.lua"]                      = "SanzoOperator",

    -- Keep Tree-sitter's keyword / control flow / return distinction.
    ["@lsp.type.keyword.lua"]                      = {},
    ["@lsp.typemod.keyword.readonly.lua"]           = "SanzoConstant",
    ["@lsp.typemod.keyword.documentation.lua"]      = "SanzoDefine",

    -- LuaLS reports self, constants and library globals as variables.
    ["@lsp.typemod.variable.definition.lua"]        = "SanzoParameter",
    ["@lsp.typemod.variable.readonly.lua"]          = "SanzoConstant",

    -- LuaLS does not supply provenance for table methods or local aliases.
    ["@lsp.typemod.variable.defaultLibrary.lua"]    = "SanzoDefine",
    ["@lsp.typemod.function.defaultLibrary.lua"]    = "SanzoFunctionLib",
    ["@lsp.typemod.method.defaultLibrary.lua"]      = "SanzoFunctionLib",
    ["@lsp.typemod.type.defaultLibrary.lua"]        = "SanzoBuiltin",
    ["@lsp.typemod.class.defaultLibrary.lua"]       = "SanzoBuiltin",

    -- LuaLS uses these token types for labels, attributes and type aliases.
    ["@lsp.type.struct.lua"]                       = "SanzoControl",
    ["@lsp.type.typeParameter.lua"]                = "SanzoKeyword",
    ["@lsp.type.macro.lua"]                        = "SanzoType",
}
