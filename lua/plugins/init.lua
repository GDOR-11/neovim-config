-- here you will find all the plugins that do not require much configuration

return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            vim.diagnostic.config({ virtual_text = false }) -- disables neovim default

            require('tiny-inline-diagnostic').setup({ preset = 'powerline' })
        end
    },
    {
        'Julian/lean.nvim',
        event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim'
        },

        ---@type lean.Config
        opts = { -- see below for full configuration options
            mappings = true,
        }
    },
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
        end
    },
    {
        'samodostal/image.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'm00qek/baleia.nvim' },
        config = function()
            require('image').setup({
                render = {
                    min_padding = 5,
                    show_label = true,
                    show_image_dimensions = true,
                    use_dither = true,
                    foreground_color = true,
                    background_color = true
                },
                events = {
                    update_on_nvim_resize = true,
                },
            })
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('todo-comments').setup()
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    'nvim-treesitter/playground',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input('Grep > ') });
            end)
        end
    },
    {
        'Mofiqul/vscode.nvim',
        as = 'vscode',
        config = function()
            vim.cmd.colorscheme('vscode')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'markdown', 'markdown_inline' },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ignore = '^$', -- ignore empty lines
                toggler = { line = '\\' },
                opleader = { line = '\\' },
                extra = { eol = '|' }
            })
        end
    },
    {
        'kawre/leetcode.nvim',
        build = ':TSUpdate html',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            arg = 'leetcode',
            lang = 'rust'
        }
    },
}
