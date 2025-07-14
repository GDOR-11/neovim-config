return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local opts = { buffer = ev.bug, remap = false }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
                end,
            })

            local nvim_lsp = require('lspconfig')

            -- denols and ts_ls need specific configurations to avoid conflicting
            nvim_lsp.denols.setup({
                on_attach = on_attach,
                root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
            })
            nvim_lsp.ts_ls.setup({
                on_attach = on_attach,
                root_dir = nvim_lsp.util.root_pattern("package.json"),
                single_file_support = false
            })
        end
    }
}
