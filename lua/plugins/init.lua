-- here you will find all the plugins that do not require much configuration

return {
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.git)
        end
    },
    'nvim-treesitter/playground',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
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
                ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "vim", "vimdoc", "query" },
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
        'mrcjkb/rustaceanvim',
        config = function()
            -- local mason_registry = require('mason-registry')
            -- local codelldb = mason_registry.get_package('codelldb')
            -- local extension_path = codelldb:get_install_path() .. '/extension/'
            -- local codelldb_path = extension_path .. 'adapter/codelldb'
            -- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
            -- local cfg = require('rustaceanvim.config')

            -- vim.g.rustaceanvim = {
            --     dap = {
            --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            --     },
            -- }
        end
    },
    'mfussenegger/nvim-dap',
}
