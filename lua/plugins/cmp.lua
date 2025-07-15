return {
    {
        'xzbdmw/colorful-menu.nvim',
        config = function()
            require('colorful-menu').setup({})
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#282828" })

            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = {
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(4),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['`'] = cmp.mapping.close()
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' }
                },
                window = {
                    documentation = {
                        border = 'rounded',
                    },
                    completion = {
                        winhighlight = 'Normal:CmpNormal'
                    }
                },
                formatting = {
                    format = function(entry, vim_item)
                        local highlights_info = require("colorful-menu").cmp_highlights(entry)
                        if highlights_info ~= nil then
                            vim_item.abbr_hl_group = highlights_info.highlights
                        end
                        return vim_item
                    end,
                }
            })

            vim.lsp.config('*', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
        end,
    }
}
