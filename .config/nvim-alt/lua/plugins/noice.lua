return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
        views = {
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            progress = {
                enabled = true,
                format = "lsp_progress",
                format_done = "✅ LSP Complete",
                thottle = 1000 / 30,
                view = "mini",
            },
            signature = {
                enabled = true,
                auto_open = {
                    enabled = true,
                    trigger = true,
                    luasnip = true,
                },
                view = nil, -- when nil, use defaults
                opts = {},
            },
            hover = {
                enabled = true,
                silent = false, -- set to true to not send a message
                view = nil, -- when nil, use defaults
                opts = {},
            },
            documentation = {
                view = "hover",
                opts = {
                    replace = true,
                },
            },
            message = {
                enabled = true,
                view = "mini",
                opts = {},
            },
        },
        notify = {
            enabled = true,
            view = "notify",
            opts = {},
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        messages = {
            -- NOTE: If you enable messages, then the cmdline is enabled automatically.
            -- This is a current Neovim limitation.
            enabled = true, -- enables the noice messages UI
            view = "notify", -- default view for messages
            view_error = "notify", -- view for errors
            view_warn = "notify", -- view for warnings
            view_history = "messages", -- view for :messages
            view_search = "virtualtext", -- view for search count messages (set to false to disable)
        },
        health = {
            checker = true, -- automatically check for config issues
        },
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
}