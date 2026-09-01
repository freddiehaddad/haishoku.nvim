-- ----------------------------------------------------------------------------
-- Sanzo: treesitter @captures
-- ----------------------------------------------------------------------------

return {
    -- functions
    ["@function"]                    = "SanzoFunction",
    ["@function.method"]             = "SanzoFunction",
    ["@function.builtin"]            = "SanzoFunctionLib",
    ["@function.macro"]              = "SanzoDefine",

    -- types
    ["@type"]                        = "SanzoType",
    ["@type.qualifier"]              = "SanzoType",
    ["@type.builtin"]                = "SanzoBuiltin",
    ["@type.library"]                = "SanzoBuiltin",

    -- definitions / modules / preproc
    ["@module"]                      = "SanzoDefine",
    ["@namespace"]                   = "SanzoDefine",
    ["@keyword.directive"]           = "SanzoDefine",
    ["@keyword.directive.define"]    = "SanzoDefine",

    -- keywords
    ["@keyword"]                     = "SanzoKeyword",
    ["@tag"]                         = "SanzoKeyword",

    -- control flow
    ["@keyword.import"]              = "SanzoControl",
    ["@keyword.conditional"]         = "SanzoControl",
    ["@keyword.conditional.ternary"] = "SanzoControl",
    ["@keyword.repeat"]              = "SanzoControl",
    ["@keyword.exception"]           = "SanzoControl",
    ["@keyword.debug"]               = "SanzoControl",
    ["@keyword.coroutine"]           = "SanzoControl",
    ["@keyword.return"]              = "SanzoReturn",

    -- strings + escapes (one green: blend > distinction)
    ["@string"]                      = "SanzoString",
    ["@character"]                   = "SanzoString",
    ["@string.escape"]               = "SanzoString",
    ["@string.regexp"]               = "SanzoString",
    ["@string.special"]              = "SanzoString",
    ["@character.special"]           = "SanzoString",
    ["@tag.attribute"]               = "SanzoString",
    ["@markup.raw"]                  = "SanzoString",

    -- numbers / booleans / named constants
    ["@boolean"]                     = "SanzoConstant",
    ["@number"]                      = "SanzoConstant",
    ["@constant"]                    = "SanzoBuiltin",

    -- operators / punctuation
    ["@operator"]                    = "SanzoOperator",
    ["@punctuation.special"]         = "SanzoOperator",
    ["@punctuation"]                 = "SanzoPunct",
    ["@tag.delimiter"]               = "SanzoPunct",

    -- content family (bone)
    ["@variable"]                    = "SanzoVariable",
    ["@variable.parameter"]          = "SanzoParameter",
    ["@property"]                    = "SanzoField",
    ["@variable.member"]             = "SanzoField",
    ["@field"]                       = "SanzoField",
    ["@constructor"]                 = "SanzoField",

    -- comments
    ["@comment"]                     = "SanzoComment",
    ["@comment.documentation"]       = "SanzoComment",
    ["@markup.quote"]                = "SanzoComment",
}
