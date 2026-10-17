-- ----------------------------------------------------------------------------
-- Haishoku: legacy Vim syntax groups
-- ----------------------------------------------------------------------------

return {
    Function     = "HaishokuFunction",
    Identifier   = "HaishokuField",

    Statement    = "HaishokuKeyword",
    Keyword      = "HaishokuKeyword",
    Operator     = "HaishokuOperator",

    Conditional  = "HaishokuControl",
    Repeat       = "HaishokuControl",
    Exception    = "HaishokuControl",
    Label        = "HaishokuControl",

    PreProc      = "HaishokuDefine",
    Define       = "HaishokuDefine",
    Include      = "HaishokuDefine",
    Macro        = "HaishokuDefine",

    Type         = "HaishokuType",
    StorageClass = "HaishokuType",
    Structure    = "HaishokuType",
    Typedef      = "HaishokuType",

    Constant     = "HaishokuBuiltin",
    Number       = "HaishokuConstant",
    Float        = "HaishokuConstant",
    Boolean      = "HaishokuConstant",
    Error        = "HaishokuConstant",

    String       = "HaishokuString",
    Character    = "HaishokuString",
    Special      = "HaishokuString",

    Delimiter    = "HaishokuPunct",
    Comment      = "HaishokuComment",
}
