-- ----------------------------------------------------------------------------
-- Haishoku: treesitter @captures
-- ----------------------------------------------------------------------------

return {
    -- functions
    ["@function"]                    = "HaishokuFunction",
    ["@function.method"]             = "HaishokuFunction",
    ["@function.builtin"]            = "HaishokuFunctionLib",
    ["@function.macro"]              = "HaishokuDefine",

    -- types
    ["@type"]                        = "HaishokuType",
    ["@type.qualifier"]              = "HaishokuType",
    ["@type.builtin"]                = "HaishokuBuiltin",
    ["@type.library"]                = "HaishokuBuiltin",

    -- definitions / modules / preproc
    ["@module"]                      = "HaishokuDefine",
    ["@namespace"]                   = "HaishokuDefine",
    ["@keyword.directive"]           = "HaishokuDefine",
    ["@keyword.directive.define"]    = "HaishokuDefine",

    -- keywords
    ["@keyword"]                     = "HaishokuKeyword",
    ["@tag"]                         = "HaishokuKeyword",

    -- control flow
    ["@keyword.import"]              = "HaishokuControl",
    ["@keyword.conditional"]         = "HaishokuControl",
    ["@keyword.conditional.ternary"] = "HaishokuControl",
    ["@keyword.repeat"]              = "HaishokuControl",
    ["@keyword.exception"]           = "HaishokuControl",
    ["@keyword.debug"]               = "HaishokuControl",
    ["@keyword.coroutine"]           = "HaishokuControl",
    ["@keyword.return"]              = "HaishokuReturn",

    -- strings + escapes (one green: blend > distinction)
    ["@string"]                      = "HaishokuString",
    ["@character"]                   = "HaishokuString",
    ["@string.escape"]               = "HaishokuString",
    ["@string.regexp"]               = "HaishokuString",
    ["@string.special"]              = "HaishokuString",
    ["@character.special"]           = "HaishokuString",
    ["@tag.attribute"]               = "HaishokuString",
    ["@markup.raw"]                  = "HaishokuString",

    -- numbers / booleans / named constants
    ["@boolean"]                     = "HaishokuConstant",
    ["@number"]                      = "HaishokuConstant",
    ["@constant"]                    = "HaishokuBuiltin",

    -- operators / punctuation
    ["@operator"]                    = "HaishokuOperator",
    ["@punctuation.special"]         = "HaishokuOperator",
    ["@punctuation"]                 = "HaishokuPunct",
    ["@tag.delimiter"]               = "HaishokuPunct",

    -- content family (bone)
    ["@variable"]                    = "HaishokuVariable",
    ["@variable.parameter"]          = "HaishokuParameter",
    ["@property"]                    = "HaishokuField",
    ["@variable.member"]             = "HaishokuField",
    ["@field"]                       = "HaishokuField",
    ["@constructor"]                 = "HaishokuField",

    -- comments
    ["@comment"]                     = "HaishokuComment",
    ["@comment.documentation"]       = "HaishokuComment",
    ["@markup.quote"]                = "HaishokuComment",
}
