return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = "1.*",
        opts = {
            keymap = { preset = "super-tab" },
            completion = { documentation = { auto_show = true } },
        }
    },
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
