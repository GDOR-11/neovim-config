return {
    -- {
    --     'xzbdmw/colorful-menu.nvim',
    --     config = function()
    --         require('colorful-menu').setup({})
    --     end
    -- },
    -- {
    --     'saghen/blink.cmp',
    --     dependencies = { 'rafamadriz/friendly-snippets', 'xzbdmw/colorful-menu.nvim' },
    --     version = "1.*",
    --     opts = {
    --         keymap = {
    --             preset = "super-tab",
    --             ["`"] = { "hide" }
    --         },
    --         signature = { enabled = true },
    --         completion = {
    --             keyword = { range = "full" },
    --             list = {
    --                 selection = {
    --                     preselect = false,
    --                     auto_insert = false
    --                 }
    --             },
    --             documentation = {
    --                 auto_show = true,
    --                 auto_show_delay_ms = 0
    --             },
    --             menu = {
    --                 draw = {
    --                     columns = { { "kind_icon" }, { "label", gap = 1 } },
    --                     components = {
    --                         label = {
    --                             text = function(ctx)
    --                                 return require("colorful-menu").blink_components_text(ctx)
    --                             end,
    --                             highlight = function(ctx)
    --                                 return require("colorful-menu").blink_components_highlight(ctx)
    --                             end
    --                         }
    --                     }
    --                 }
    --             }
    --         },
    --     },
    --     config = function()
    --         require('blink.cmp').setup()
    --         vim.lsp.config('*', {
    --             capabilities = require('blink.cmp').get_lsp_capabilities(),
    --         })
    --     end,
    -- },
    {
        "saghen/blink.nvim",
        build = "cargo build --release",
        lazy = false,
        opts = {
            chartoggle = { enabled = true }
        },
        keys = {
            {
                ';',
                function()
                    require('blink.chartoggle').toggle_char_eol(';')
                end,
                mode = { 'n', 'v' }
            },
            {
                ',',
                function()
                    require('blink.chartoggle').toggle_char_eol(',')
                end,
                mode = { 'n', 'v' }
            }
        }
    }
}
