-- ----------------------------------------------------------------------------
-- Haishoku: Assembly (GAS / NASM / MASM via tree-sitter-asm)
-- ----------------------------------------------------------------------------

return {
    ["@label.asm"]             = "HaishokuFunction",
    ["@constant.asm"]          = "HaishokuConstant",
    ["@constant.builtin.asm"]  = "HaishokuConstant",
    ["@variable.builtin.asm"]  = "HaishokuParameter",
    ["@function.call.asm"]     = "HaishokuFunction",
    ["@keyword.function.asm"]  = "HaishokuKeyword",
    ["@keyword.type.asm"]      = "HaishokuKeyword",
}
