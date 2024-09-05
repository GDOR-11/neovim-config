-- project view (a.k.a. open file system)
vim.keymap.set('n', '<leader>pv', function()
    -- must be a pcall, because vim.cmd('w') throws an error when 'readonly' is set on
    pcall(vim.cmd['w'])
    vim.cmd('Neotree')
end)

-- git view
vim.keymap.set('n', '<leader>gv', function()
    pcall(vim.cmd['w'])
    vim.cmd('Neotree git_status')
end)

-- come to neovim configuration folder quickly
vim.keymap.set('n', '<leader>vpp', '<cmd>Neotree ~/.config/nvim/lua<CR>');

-- I hate sideways scrolling
vim.keymap.set({ 'n', 'l', 'v', 'o', 't' }, '<ScrollWheelLeft>', '')
vim.keymap.set({ 'n', 'l', 'v', 'o', 't' }, '<ScrollWheelRight>', '')

-- easily and thoughtlessly create new splits
vim.keymap.set('n', '<leader>vs', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>hs', '<cmd>split<CR>')

-- these two keymaps make working with the terminal emulator easier:
-- use <leader>t to open a terminal in a new pane in insert mode already
-- after finishing, you can press esc to come back to normal mode
vim.keymap.set('n', '<leader>t', function()
    local filepath = vim.fn.expand('%:p')
    local parent = string.gmatch(filepath, '(.*)/[^/]*$')()
    print(parent)
    vim.cmd('rightbelow vsplit')
    vim.cmd('terminal')
    vim.fn.feedkeys('icd ' .. parent .. '\10');
end)
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- convenient for switching windows
vim.keymap.set('i', '<C-w>', '<ESC><C-w>')
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>')

-- if I forget to change my keyboard language
vim.keymap.set('n', 'Ç', ':');

-- for quick buffer reloading
vim.keymap.set('n', '<leader>r', '<cmd>e<CR>')

-- quick and easy way to add and remove empty lines to make code less dense
-- (enter adds a line, backspace removes one)
vim.keymap.set('n', '<CR>', '$a<CR>.<ESC>v0"_d')
vim.keymap.set('n', '<BS>', function ()
    local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
    vim.fn.feedkeys('"_dd:' .. (line - 1) .. '\10')
end)

-- related to the previous one
vim.keymap.set('v', '<BS>', 'd')

-- now you don't have to worry about releasing shift
vim.keymap.set('n', ':W', ':w')
vim.keymap.set('n', ':Q', ':q')

-- easy way to insert semicolon at the end of the line
vim.keymap.set('n', ';', function()
    local _, column = unpack(vim.api.nvim_win_get_cursor(0))
    vim.fn.feedkeys('$a;\27\48' .. column .. 'l')
end)

-- I like tab and shift+tab better
-- also, I don't like that > and < deselect the code by default
vim.keymap.set('x', '<Tab>',   function() if vim.fn.mode() == 'V' then vim.fn.feedkeys('>gv') end end)
vim.keymap.set('x', '<S-Tab>', function() if vim.fn.mode() == 'V' then vim.fn.feedkeys('<gv') end end)
vim.keymap.set('n', '<Tab>',   'V>')
vim.keymap.set('n', '<S-Tab>', 'V<')

-- very useful for moving pieces of text up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- useful for scrolling up and down fast
vim.keymap.set('n', '<C-d>', '16j')
vim.keymap.set('n', '<C-u>', '16k')
vim.keymap.set('i', '<C-d>', '<ESC>16ja')
vim.keymap.set('i', '<C-u>', '<ESC>16ka')

-- good for going to the previous and to the next match
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- <leader>y is much more intuitive than "+y to copy to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])

-- shortcut to format the entire buffer
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- make macros easier (q to start recording, # to replay)
vim.keymap.set('n', 'q', (function()
    local recording = false
    vim.keymap.set('n', '∬', 'q') -- I used this to avoid recursion
    return function()
        if recording then
            vim.fn.feedkeys('∬')
        else
            vim.fn.feedkeys('∬a')
        end
        recording = not recording
    end
end)())
vim.keymap.set('n', '#', '@a')

-- go to next and previous errors
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

-- no idea what this does to be fear
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- replace the word under the cursor across the entire file
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- turn the current file into an executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- source a configuration file
vim.keymap.set('n', '<leader><leader>', function()
    vim.cmd('so')
end)
