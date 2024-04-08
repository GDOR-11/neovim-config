-- save and leave, instead of just leaving
vim.keymap.set("n", "<leader>pv", function()
    -- must be a pcall, because vim.cmd("w") throws an error when 'readonly' is set on
    pcall(vim.cmd["w"])
    vim.cmd("Ex")
end)

-- these two keymaps make working with the terminal emulator easier:
-- use <leader>t to open a terminal in a new pane in insert mode already
-- after finishing, you can press esc to come back to normal mode
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("rightbelow vsplit")
    vim.cmd("terminal")
    vim.cmd("startinsert")
end)
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- convenient for switching windows
vim.keymap.set("i", "<C-w>", "<ESC><C-w>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- if I forget to change my keyboard language
vim.keymap.set("n", "Ç", ":");

-- for quick buffer reloading
vim.keymap.set("n", "<leader>r", ":e<CR>")

-- quick and easy way to add and remove empty lines to make code less dense
-- (enter adds a line, backspace removes one)
vim.keymap.set("n", "<CR>", "j0i<CR><ESC>k")
vim.keymap.set("n", "<BS>", "ddjkk")

-- related to the previous one
vim.keymap.set("v", "<BS>", "d")

-- now you don't have to worry about releasing shift
vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", ":Q", ":q")

-- very useful for moving pieces of text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- useful for scrolling up and down fast
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("i", "<C-d>", "<ESC><C-d>zza")
vim.keymap.set("i", "<C-u>", "<ESC><C-u>zza")

-- good for going to the previous and to the next match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>y is much more intuitive than "+y to copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- go to next and previous errors
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- no idea
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word under the cursor across the entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- turn the current file into an executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- come to neovim configuration folder
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/gdor11<CR>");

-- source the configuration file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
