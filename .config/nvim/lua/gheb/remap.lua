vim.g.mapleader = " "

-- back to explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- with C-V moves lines up & down with C-J C-K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor where it is when moving a line up
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle while half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle through search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep the first highlight selection in buffer for next copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system buffer to copy-paster outside
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- into the void
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- fear prevention
vim.keymap.set("n", "Q", "<nop>")

-- tmux window to navigate projects and come back with C-a L
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace on the all document the word we're on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
