-- ----------------------------------------------------------------------------
-- Sanzo: legacy Vim syntax groups
-- ----------------------------------------------------------------------------

return {
    Function     = "SanzoFunction",
    Identifier   = "SanzoField",

    Statement    = "SanzoKeyword",
    Keyword      = "SanzoKeyword",
    Operator     = "SanzoOperator",

    Conditional  = "SanzoControl",
    Repeat       = "SanzoControl",
    Exception    = "SanzoControl",
    Label        = "SanzoControl",

    PreProc      = "SanzoDefine",
    Define       = "SanzoDefine",
    Include      = "SanzoDefine",
    Macro        = "SanzoDefine",

    Type         = "SanzoType",
    StorageClass = "SanzoType",
    Structure    = "SanzoType",
    Typedef      = "SanzoType",

    Constant     = "SanzoBuiltin",
    Number       = "SanzoConstant",
    Float        = "SanzoConstant",
    Boolean      = "SanzoConstant",
    Error        = "SanzoConstant",

    String       = "SanzoString",
    Character    = "SanzoString",
    Special      = "SanzoString",

    Delimiter    = "SanzoPunct",
    Comment      = "SanzoComment",
}
