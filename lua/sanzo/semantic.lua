-- ----------------------------------------------------------------------------
-- Sanzo: runtime priority corrections for LSP semantic tokens
-- ----------------------------------------------------------------------------

local M = {}

local SEMANTIC_CORRECTION_PRIORITY = 140
local COMMENT_PRIORITY = 150

local LUA_BUILTIN_TYPES = {
    ["nil"] = true, ["true"] = true, ["false"] = true, ["function"] = true,
    any = true, unknown = true, boolean = true, number = true, integer = true,
    string = true, table = true, thread = true, userdata = true, lightuserdata = true,
}

local function lua_group(token, buf)
    local builtin_type = token.type == "type" and not token.modifiers.modification
    local library_variable = token.type == "variable" and token.modifiers.defaultLibrary
    local readonly_variable = token.type == "variable" and token.modifiers.readonly
    if not (builtin_type or library_variable or readonly_variable) then return end

    local text = vim.api.nvim_buf_get_text(buf, token.line, token.start_col,
        token.line, token.end_col, {})[1]

    -- LuaLS omits builtin provenance for annotation types and _ENV.
    if builtin_type and LUA_BUILTIN_TYPES[text] then return "SanzoBuiltin" end
    if library_variable and text == "_VERSION" then return "SanzoConstant" end
    if readonly_variable and text == "_ENV" then return "SanzoDefine" end
end

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
                highlight(args, "@lsp.type.macro." .. vim.bo[args.buf].filetype,
                    SEMANTIC_CORRECTION_PRIORITY)
            elseif tok.type == "function" and tok.modifiers.defaultLibrary then
                highlight(args, "SanzoFunctionLib", SEMANTIC_CORRECTION_PRIORITY)
            elseif tok.type == "type" and tok.modifiers.defaultLibrary then
                highlight(args, "SanzoBuiltin", SEMANTIC_CORRECTION_PRIORITY)
            elseif vim.bo[args.buf].filetype == "lua" then
                local group = lua_group(tok, args.buf)
                if group then highlight(args, group, SEMANTIC_CORRECTION_PRIORITY) end
            end
        end,
    })
end

return M
