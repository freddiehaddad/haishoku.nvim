-- ----------------------------------------------------------------------------
-- Haishoku: Rust / rust-analyzer  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    -- Rust values are not types, even when their names are capitalized.
    ["@constant.rust"]                              = "HaishokuConstant",
    ["@constant.builtin.rust"]                      = "HaishokuConstant",
    ["@constructor.rust"]                           = "HaishokuType",
    ["@variable.builtin.rust"]                      = "HaishokuParameter",
    ["@character.special.rust"]                     = "HaishokuOperator",
    ["@label.rust"]                                 = "HaishokuControl",
    ["@keyword.import.rust"]                        = "HaishokuDefine",

    -- Keep Tree-sitter's keyword / control flow / return distinction.
    ["@lsp.type.keyword.rust"]                      = {},

    -- rust-analyzer's additional type and value categories
    ["@lsp.type.typeAlias.rust"]                    = "HaishokuType",
    ["@lsp.type.union.rust"]                        = "HaishokuType",
    ["@lsp.type.selfTypeKeyword.rust"]              = "HaishokuType",
    ["@lsp.type.lifetime.rust"]                     = "HaishokuType",
    ["@lsp.type.selfKeyword.rust"]                  = "HaishokuParameter",
    ["@lsp.type.label.rust"]                        = "HaishokuControl",
    ["@lsp.type.const.rust"]                        = "HaishokuConstant",
    ["@lsp.type.constParameter.rust"]               = "HaishokuConstant",
    ["@lsp.type.static.rust"]                       = "HaishokuVariable",
    ["@lsp.type.boolean.rust"]                      = "HaishokuConstant",
    ["@lsp.typemod.variable.constant.rust"]         = "HaishokuConstant",

    -- Only defaultLibrary means Rust's standard library; library also
    -- includes third-party crates, which retain the user-defined roles.
    ["@lsp.typemod.function.defaultLibrary.rust"]   = "HaishokuFunctionLib",
    ["@lsp.typemod.method.defaultLibrary.rust"]     = "HaishokuFunctionLib",
    ["@lsp.typemod.type.defaultLibrary.rust"]       = "HaishokuBuiltin",
    ["@lsp.typemod.struct.defaultLibrary.rust"]     = "HaishokuBuiltin",
    ["@lsp.typemod.enum.defaultLibrary.rust"]       = "HaishokuBuiltin",
    ["@lsp.typemod.interface.defaultLibrary.rust"]  = "HaishokuBuiltin",
    ["@lsp.typemod.union.defaultLibrary.rust"]      = "HaishokuBuiltin",
    ["@lsp.typemod.typeAlias.defaultLibrary.rust"]  = "HaishokuBuiltin",

    -- attributes, derives and macros share the definition role
    ["@lsp.type.attribute.rust"]                    = "HaishokuDefine",
    ["@lsp.type.builtinAttribute.rust"]             = "HaishokuDefine",
    ["@lsp.type.derive.rust"]                       = "HaishokuDefine",
    ["@lsp.type.deriveHelper.rust"]                 = "HaishokuDefine",
    ["@lsp.type.procMacro.rust"]                    = "HaishokuDefine",
    ["@lsp.type.macroBang.rust"]                    = "HaishokuDefine",
    ["@lsp.type.toolModule.rust"]                   = "HaishokuDefine",

    -- strings and their contents stay in one family
    ["@lsp.type.character.rust"]                    = "HaishokuString",
    ["@lsp.type.escapeSequence.rust"]               = "HaishokuString",
    ["@lsp.type.formatSpecifier.rust"]              = "HaishokuString",
}
