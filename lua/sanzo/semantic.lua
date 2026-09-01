-- ----------------------------------------------------------------------------
-- Sanzo: LSP defaultLibrary hook (stdlib fns/types — LSP-only, needs runtime)
-- ----------------------------------------------------------------------------

local M = {}

function M.setup()
    local grp = vim.api.nvim_create_augroup("SanzoSemantic", { clear = true })

    vim.api.nvim_create_autocmd("LspTokenUpdate", {
        group = grp,
        callback = function(args)
            if vim.g.colors_name ~= "sanzo" then return end
            local tok = args.data.token

            if tok.type == "function" and tok.modifiers.defaultLibrary then
                vim.lsp.semantic_tokens.highlight_token(
                    tok, args.buf, args.data.client_id, "SanzoFunctionLib",
                    { priority = 200 })
            end

            if tok.type == "type" and tok.modifiers.defaultLibrary then
                vim.lsp.semantic_tokens.highlight_token(
                    tok, args.buf, args.data.client_id, "SanzoBuiltin",
                    { priority = 200 })
            end
        end,
    })
end

return M
