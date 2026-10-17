-- ----------------------------------------------------------------------------
-- Haishoku: C per-language  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    -- macros
    ["@function.macro.c"]                        = "HaishokuDefine",
    ["@lsp.typemod.macro.globalScope.c"]         = "HaishokuDefine",
    ["@lsp.typemod.macro.fileScope.c"]           = "HaishokuDefine",
    ["@lsp.typemod.macro.defaultLibrary.c"]      = "HaishokuDefine",
    ["@lsp.typemod.macro.declaration.c"]         = "HaishokuDefine",

    -- properties / fields
    ["@lsp.type.property.c"]                     = "HaishokuField",
    ["@lsp.typemod.property.declaration.c"]      = "HaishokuField",
    ["@lsp.typemod.property.classScope.c"]       = "HaishokuField",

    -- parameters
    ["@lsp.type.parameter.c"]                    = "HaishokuParameter",
    ["@lsp.typemod.parameter.functionScope.c"]   = "HaishokuParameter",
    ["@lsp.typemod.parameter.declaration.c"]     = "HaishokuParameter",
    ["@lsp.typemod.parameter.definition.c"]      = "HaishokuParameter",
    ["@lsp.mod.functionScope.c"]                 = {},

    -- enum members
    ["@lsp.type.enumMember.c"]                   = "HaishokuConstant",
    ["@lsp.typemod.enumMember.readonly.c"]       = "HaishokuConstant",
    ["@lsp.typemod.enumMember.fileScope.c"]      = "HaishokuConstant",
    ["@lsp.typemod.enumMember.defaultLibrary.c"] = "HaishokuConstant",

    -- types
    ["@lsp.typemod.type.defaultLibrary.c"]       = "HaishokuBuiltin",
    ["@lsp.typemod.type.fileScope.c"]            = "HaishokuType",

    -- constants / globals
    ["@constant.builtin.c"]                      = "HaishokuBuiltin",
    ["@lsp.typemod.function.globalScope.c"]      = "HaishokuFunction",
}
