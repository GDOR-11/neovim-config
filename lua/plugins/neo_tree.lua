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

            local function dirent_creator(file)
                local create_dirent = require('neo-tree.sources.filesystem.lib.fs_actions')
                    [file and 'create_node' or 'create_directory']
                return function(state, callback)
                    local name_as_dir = state.tree:get_node():get_id() .. '/'
                    local result = os.rename(name_as_dir, name_as_dir)
                    local parent_directory = result and name_as_dir or state.path
                    create_dirent(
                        parent_directory,
                        function()
                            vim.fn.feedkeys(' r')
                            if callback ~= nil then callback() end
                        end,
                        parent_directory
                    )
                end
            end

            require('neo-tree').setup({
                default_component_configs = {
                    indent = {
                        indent_size = 4
                    },
                },
                window = {
                    position = 'current',
                    mappings = {
                        ['%'] = dirent_creator(true),
                        ['d'] = dirent_creator(false),
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
