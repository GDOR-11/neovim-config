return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap, dapui = require('dap'), require('dapui')
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

            -- keybindings
            vim.keymap.set('n', '<leader>dl', dap.step_into)
            vim.keymap.set('n', '<leader>dj', dap.step_over)
            vim.keymap.set('n', '<leader>dk', dap.step_out)
            vim.keymap.set('n', '<leader>dc', dap.continue)
            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
            vim.keymap.set('n', '<leader>dd', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
            vim.keymap.set('n', '<leader>de', dap.terminate)
            vim.keymap.set('n', '<leader>dr', dap.run_last)
            vim.keymap.set('n', '<leader>dt', function() vim.cmd('RustLsp testables') end)
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim'
        },
        config = function()
            require('dapui').setup()
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
        opts = {
            handlers = {}
        }
    }
    -- {
    --     'mrcjkb/rustaceanvim',
    --     lazy = false,
    --     dependencies = { 'mason-org/mason-lspconfig.nvim' },
    --     config = function()
    --         local mason_registry = require('mason-registry')
    --         local codelldb = mason_registry.get_package('codelldb')
    --         -- if you're getting an error here, make sure you have codelldb installed via Mason
    --         local extension_path = '$MASON/share/codelldb/extension'
    --         local codelldb_path = extension_path .. 'adapter/codelldb'
    --         local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
    --         local cfg = require('rustaceanvim.config')

    --         vim.g.rustaceanvim = {
    --             dap = {
    --                 adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    --             },
    --         }
    --     end
    -- },
}
