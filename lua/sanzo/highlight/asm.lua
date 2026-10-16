-- ----------------------------------------------------------------------------
-- Sanzo: Assembly (GAS / NASM / MASM via tree-sitter-asm)
-- ----------------------------------------------------------------------------

return {
    ["@label.asm"]             = "SanzoFunction",
    ["@constant.asm"]          = "SanzoConstant",
    ["@constant.builtin.asm"]  = "SanzoConstant",
    ["@variable.builtin.asm"]  = "SanzoParameter",
    ["@function.call.asm"]     = "SanzoFunction",
    ["@keyword.function.asm"]  = "SanzoKeyword",
    ["@keyword.type.asm"]      = "SanzoKeyword",
}
