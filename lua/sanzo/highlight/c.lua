-- ----------------------------------------------------------------------------
-- Sanzo: C per-language  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    -- macros
    ["@function.macro.c"]                        = "SanzoDefine",
    ["@lsp.typemod.macro.globalScope.c"]         = "SanzoDefine",
    ["@lsp.typemod.macro.fileScope.c"]           = "SanzoDefine",
    ["@lsp.typemod.macro.defaultLibrary.c"]      = "SanzoDefine",
    ["@lsp.typemod.macro.declaration.c"]         = "SanzoDefine",

    -- properties / fields
    ["@lsp.type.property.c"]                     = "SanzoField",
    ["@lsp.typemod.property.declaration.c"]      = "SanzoField",
    ["@lsp.typemod.property.classScope.c"]       = "SanzoField",

    -- parameters
    ["@lsp.type.parameter.c"]                    = "SanzoParameter",
    ["@lsp.typemod.parameter.functionScope.c"]   = "SanzoParameter",
    ["@lsp.typemod.parameter.declaration.c"]     = "SanzoParameter",
    ["@lsp.typemod.parameter.definition.c"]      = "SanzoParameter",
    ["@lsp.mod.functionScope.c"]                 = {},

    -- enum members
    ["@lsp.type.enumMember.c"]                   = "SanzoConstant",
    ["@lsp.typemod.enumMember.readonly.c"]       = "SanzoConstant",
    ["@lsp.typemod.enumMember.fileScope.c"]      = "SanzoConstant",
    ["@lsp.typemod.enumMember.defaultLibrary.c"] = "SanzoConstant",

    -- types
    ["@lsp.typemod.type.defaultLibrary.c"]       = "SanzoBuiltin",
    ["@lsp.typemod.type.fileScope.c"]            = "SanzoType",

    -- constants / globals
    ["@constant.builtin.c"]                      = "SanzoBuiltin",
    ["@lsp.typemod.function.globalScope.c"]      = "SanzoFunction",
}
