-- here you will find all the plugins that do not require much configuration

return {
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
                ensure_installed = { 'javascript', 'typescript', 'rust', 'c', 'lua', 'vim', 'vimdoc', 'query' },
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
}
