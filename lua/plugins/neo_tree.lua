return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('neo-tree').setup({
                default_component_configs = {
                    indent = {
                        indent_size = 4
                    },
                },
                window = {
                    position = 'current',
                    mappings = {
                        ['%'] = 'add',
                        ['d'] = 'add_directory',
                        ['D'] = 'delete',
                        ['R'] = 'rename',
                        ['<leader>r'] = 'refresh',
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                    },
                    window = {
                        mappings = {
                            ['-'] = 'navigate_up',
                            ['<S-CR>'] = 'set_root',
                        },
                    },
                },
            })
        end
    },
}
