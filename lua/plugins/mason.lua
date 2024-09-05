return {
    {
        'williamboman/mason.nvim',
        dependencies = { 'VonHeikemen/lsp-zero.nvim' },
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            local lsp_zero = require('lsp-zero')

            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
                        require('lspconfig').lua_ls.setup({
                            on_init = function(client)
                                local path = client.workspace_folders[1].name
                                if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                                    return
                                end

                                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,
                                    {
                                        runtime = {
                                            version = 'LuaJIT'
                                        },
                                        workspace = {
                                            checkThirdParty = false,
                                            library = {
                                                vim.env.VIMRUNTIME
                                            }
                                        }
                                    }
                                )
                            end,
                            settings = {
                                Lua = {}
                            }
                        })
                    end
                }
            })
        end
    },
}
