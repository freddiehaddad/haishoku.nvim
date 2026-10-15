-- ----------------------------------------------------------------------------
-- Sanzo: Rust / rust-analyzer  ({} = clear, let treesitter drive)
-- ----------------------------------------------------------------------------

return {
    -- Rust values are not types, even when their names are capitalized.
    ["@constant.rust"]                              = "SanzoConstant",
    ["@constant.builtin.rust"]                      = "SanzoConstant",
    ["@constructor.rust"]                           = "SanzoType",
    ["@variable.builtin.rust"]                      = "SanzoParameter",
    ["@character.special.rust"]                     = "SanzoOperator",
    ["@label.rust"]                                 = "SanzoControl",
    ["@keyword.import.rust"]                        = "SanzoDefine",

    -- Keep Tree-sitter's keyword / control flow / return distinction.
    ["@lsp.type.keyword.rust"]                      = {},

    -- rust-analyzer's additional type and value categories
    ["@lsp.type.typeAlias.rust"]                    = "SanzoType",
    ["@lsp.type.union.rust"]                        = "SanzoType",
    ["@lsp.type.selfTypeKeyword.rust"]              = "SanzoType",
    ["@lsp.type.lifetime.rust"]                     = "SanzoType",
    ["@lsp.type.selfKeyword.rust"]                  = "SanzoParameter",
    ["@lsp.type.label.rust"]                        = "SanzoControl",
    ["@lsp.type.const.rust"]                        = "SanzoConstant",
    ["@lsp.type.constParameter.rust"]               = "SanzoConstant",
    ["@lsp.type.static.rust"]                       = "SanzoVariable",
    ["@lsp.type.boolean.rust"]                      = "SanzoConstant",
    ["@lsp.typemod.variable.constant.rust"]         = "SanzoConstant",

    -- Only defaultLibrary means Rust's standard library; library also
    -- includes third-party crates, which retain the user-defined roles.
    ["@lsp.typemod.function.defaultLibrary.rust"]   = "SanzoFunctionLib",
    ["@lsp.typemod.method.defaultLibrary.rust"]     = "SanzoFunctionLib",
    ["@lsp.typemod.type.defaultLibrary.rust"]       = "SanzoBuiltin",
    ["@lsp.typemod.struct.defaultLibrary.rust"]     = "SanzoBuiltin",
    ["@lsp.typemod.enum.defaultLibrary.rust"]       = "SanzoBuiltin",
    ["@lsp.typemod.interface.defaultLibrary.rust"]  = "SanzoBuiltin",
    ["@lsp.typemod.union.defaultLibrary.rust"]      = "SanzoBuiltin",
    ["@lsp.typemod.typeAlias.defaultLibrary.rust"]  = "SanzoBuiltin",

    -- attributes, derives and macros share the definition role
    ["@lsp.type.attribute.rust"]                    = "SanzoDefine",
    ["@lsp.type.builtinAttribute.rust"]             = "SanzoDefine",
    ["@lsp.type.derive.rust"]                       = "SanzoDefine",
    ["@lsp.type.deriveHelper.rust"]                 = "SanzoDefine",
    ["@lsp.type.procMacro.rust"]                    = "SanzoDefine",
    ["@lsp.type.macroBang.rust"]                    = "SanzoDefine",
    ["@lsp.type.toolModule.rust"]                   = "SanzoDefine",

    -- strings and their contents stay in one family
    ["@lsp.type.character.rust"]                    = "SanzoString",
    ["@lsp.type.escapeSequence.rust"]               = "SanzoString",
    ["@lsp.type.formatSpecifier.rust"]              = "SanzoString",
}
