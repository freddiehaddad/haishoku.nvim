-- ----------------------------------------------------------------------------
-- Sanzo: runtime priority corrections for LSP semantic tokens
-- ----------------------------------------------------------------------------

local M = {}

local DEFAULT_LIBRARY_PRIORITY = 140
local COMMENT_PRIORITY = 150

function M.setup()
    local grp = vim.api.nvim_create_augroup("SanzoSemantic", { clear = true })

    vim.api.nvim_create_autocmd("LspTokenUpdate", {
        group = grp,
        callback = function(args)
            if vim.g.colors_name ~= "sanzo" then return end
            local tok = args.data.token

            if tok.type == "comment" then
                vim.lsp.semantic_tokens.highlight_token(
                    tok, args.buf, args.data.client_id, "SanzoComment",
                    { priority = COMMENT_PRIORITY })
            end

            if tok.type == "function" and tok.modifiers.defaultLibrary then
                vim.lsp.semantic_tokens.highlight_token(
                    tok, args.buf, args.data.client_id, "SanzoFunctionLib",
                    { priority = DEFAULT_LIBRARY_PRIORITY })
            end

            if tok.type == "type" and tok.modifiers.defaultLibrary then
                vim.lsp.semantic_tokens.highlight_token(
                    tok, args.buf, args.data.client_id, "SanzoBuiltin",
                    { priority = DEFAULT_LIBRARY_PRIORITY })
            end
        end,
    })
end

return M
