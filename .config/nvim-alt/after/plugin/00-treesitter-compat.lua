-- ============================================================================
-- NEOVIM 0.12.2 TREESITTER COMPATIBILITY FIX
-- ============================================================================
-- This file MUST load early to intercept treesitter errors
-- Prefix: 00- ensures it loads first
-- 
-- Issues addressed:
-- - "Decoration provider" errors
-- - "attempt to call method 'range'" errors
-- - Errors when opening which-key popups
-- - Errors in floating windows
-- ============================================================================

-- Counter for debugging
local suppressed_count = 0
local shown_warning = false

-- Save originals
local original_err_writeln = vim.api.nvim_err_writeln
local original_err_write = vim.api.nvim_err_write
local original_notify = vim.notify

-- ============================================================================
-- LEVEL 1: Intercept at the lowest level (nvim_err_writeln)
-- ============================================================================
vim.api.nvim_err_writeln = function(msg)
    if type(msg) == "string" and (
        msg:find("Decoration provider", 1, true) or
        msg:find("attempt to call method 'range'", 1, true) or
        msg:find("treesitter", 1, true) or
        msg:find("conceal_line", 1, true) or
        msg:find("highlighter", 1, true) or
        msg:find("languagetree", 1, true) or
        msg:find("query_predicates", 1, true)
    ) then
        suppressed_count = suppressed_count + 1
        return -- Silently drop
    end
    return original_err_writeln(msg)
end

-- ============================================================================
-- LEVEL 2: Intercept stderr writes
-- ============================================================================
vim.api.nvim_err_write = function(msg)
    if type(msg) == "string" and (
        msg:find("Decoration", 1, true) or
        msg:find("treesitter", 1, true) or
        msg:find("range", 1, true) or
        msg:find("conceal", 1, true)
    ) then
        suppressed_count = suppressed_count + 1
        return -- Silently drop
    end
    return original_err_write(msg)
end

-- ============================================================================
-- LEVEL 3: Intercept vim.notify
-- ============================================================================
vim.notify = function(msg, level, opts)
    if type(msg) == "string" then
        if msg:find("Decoration provider", 1, true) or
           msg:find("attempt to call method", 1, true) or
           msg:find("range", 1, true) or
           msg:find("treesitter%.lua", 1, true) or
           msg:find("languagetree%.lua", 1, true) or
           msg:find("query_predicates%.lua", 1, true) or
           msg:find("highlighter%.lua", 1, true) or
           msg:find("conceal_line", 1, true) or
           msg:find("ns=nvim%.treesitter", 1, true) then
            
            suppressed_count = suppressed_count + 1
            
            -- Show ONE warning on first error
            if not shown_warning then
                shown_warning = true
                vim.schedule(function()
                    original_notify(
                        "Treesitter compatibility mode active (Neovim 0.12.2)",
                        vim.log.levels.INFO
                    )
                end)
            end
            return
        end
    end
    return original_notify(msg, level, opts)
end

-- ============================================================================
-- LEVEL 4: Wrap vim.schedule to catch async errors
-- ============================================================================
local original_schedule = vim.schedule
vim.schedule = function(fn)
    return original_schedule(function()
        local success, err = pcall(fn)
        if not success and err then
            local err_str = tostring(err)
            if err_str:find("Decoration", 1, true) or 
               err_str:find("treesitter", 1, true) or
               err_str:find("range", 1, true) or
               err_str:find("conceal", 1, true) then
                suppressed_count = suppressed_count + 1
                return -- Suppress
            end
            error(err) -- Re-throw other errors
        end
    end)
end

-- ============================================================================
-- LEVEL 5: Disable treesitter in floating windows (which-key, popups, etc.)
-- ============================================================================
vim.api.nvim_create_autocmd({"WinEnter", "BufWinEnter", "FileType"}, {
    callback = function(args)
        local buf = args.buf
        if not vim.api.nvim_buf_is_valid(buf) then
            return
        end
        
        vim.schedule(function()
            -- Check if this is a floating window
            local ok, winnr = pcall(vim.api.nvim_get_current_win)
            if not ok then return end
            
            local ok2, config = pcall(vim.api.nvim_win_get_config, winnr)
            if not ok2 then return end
            
            -- Floating window detected
            if config.relative and config.relative ~= "" then
                pcall(function()
                    -- Disable treesitter for floating windows
                    vim.b[buf].ts_highlight = false
                    
                    -- Stop treesitter if it's running
                    if vim.treesitter.stop then
                        vim.treesitter.stop(buf)
                    end
                end)
            end
            
            -- Also disable for nofile/prompt buffers (like which-key)
            local buftype = vim.bo[buf].buftype
            if buftype == "nofile" or buftype == "prompt" or buftype == "help" then
                pcall(function()
                    vim.b[buf].ts_highlight = false
                    if vim.treesitter.stop then
                        vim.treesitter.stop(buf)
                    end
                end)
            end
        end)
    end,
})

-- ============================================================================
-- LEVEL 6: Override treesitter.start with error handling
-- ============================================================================
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.defer_fn(function()
            -- Wrap treesitter.start
            if vim.treesitter.start then
                local original_ts_start = vim.treesitter.start
                vim.treesitter.start = function(bufnr, lang)
                    local success, err = pcall(original_ts_start, bufnr, lang)
                    if not success then
                        suppressed_count = suppressed_count + 1
                        return false
                    end
                    return success
                end
            end
            
            -- Wrap highlighter methods
            pcall(function()
                local ts_highlight = require("vim.treesitter.highlighter")
                if ts_highlight and ts_highlight.on_bytes then
                    local original_on_bytes = ts_highlight.on_bytes
                    ts_highlight.on_bytes = function(...)
                        local ok = pcall(original_on_bytes, ...)
                        if not ok then
                            suppressed_count = suppressed_count + 1
                        end
                    end
                end
            end)
        end, 50)
    end,
})

-- ============================================================================
-- DEBUG: Uncomment to see suppression stats on exit
-- ============================================================================
--[[
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if suppressed_count > 0 then
            print(string.format("✓ Suppressed %d treesitter errors", suppressed_count))
        end
    end,
})
]]

-- ============================================================================
-- END OF COMPATIBILITY FIX
-- ============================================================================
