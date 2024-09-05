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
            -- TODO: see wth all this shit is doing
            local log = require("neo-tree.log")
            local fs_actions = require("neo-tree.sources.filesystem.lib.fs_actions")

            local function get_folder_node(state)
                local node = state.tree:get_node()
                while node.get_parent_id() do
                    node = state.tree:get_node(node.get_parent_id())
                end
                return node
            end
            local function get_using_root_directory(state)
                -- default to showing only the basename of the path
                local using_root_directory = get_folder_node(state):get_id()
                local show_path = state.config.show_path
                if show_path == "absolute" then
                    using_root_directory = ""
                elseif show_path == "relative" then
                    using_root_directory = state.path
                elseif show_path ~= nil and show_path ~= "none" then
                    log.warn(
                        'A neo-tree mapping was setup with a config.show_path option with invalid value: "'
                        .. show_path
                        .. '", falling back to its default: nil/"none"'
                    )
                end
                return using_root_directory
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
                        ['%'] = function(state, callback)
                            local node = get_folder_node(state)
                            local in_directory = node:get_id()
                            local using_root_directory = get_using_root_directory(state)
                            fs_actions.create_node(in_directory, callback, using_root_directory)
                        end,
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
