-- ----------------------------------------------------------------------------
-- Sanzo: runtime priority corrections for LSP semantic tokens
-- ----------------------------------------------------------------------------

local M = {}

local SEMANTIC_CORRECTION_PRIORITY = 140
local COMMENT_PRIORITY = 150

local function highlight(args, group, priority)
    vim.lsp.semantic_tokens.highlight_token(
        args.data.token, args.buf, args.data.client_id, group,
        { priority = priority })
end

function M.setup()
    local grp = vim.api.nvim_create_augroup("SanzoSemantic", { clear = true })

    vim.api.nvim_create_autocmd("LspTokenUpdate", {
        group = grp,
        callback = function(args)
            if vim.g.colors_name ~= "sanzo" then return end
            local tok = args.data.token

            if tok.type == "comment" then
                highlight(args, "SanzoComment", COMMENT_PRIORITY)
            elseif tok.type == "macro" then
                highlight(args, "SanzoDefine", SEMANTIC_CORRECTION_PRIORITY)
            elseif tok.type == "function" and tok.modifiers.defaultLibrary then
                highlight(args, "SanzoFunctionLib", SEMANTIC_CORRECTION_PRIORITY)
            elseif tok.type == "type" and tok.modifiers.defaultLibrary then
                highlight(args, "SanzoBuiltin", SEMANTIC_CORRECTION_PRIORITY)
            end
        end,
    })
end

return M
