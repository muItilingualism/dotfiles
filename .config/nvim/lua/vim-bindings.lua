-- open netrw for file nav
vim.keymap.set(
    "n",
    "<leader>pv",
    ":Neotree position=current<CR>",
    { desc = "Open Neotree" }
)

-- force hjkl instead of arrows
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("i", "<left>", "<Nop>")
vim.keymap.set("i", "<right>", "<Nop>")
vim.keymap.set("i", "<up>", "<Nop>")
vim.keymap.set("i", "<down>", "<Nop>")

vim.keymap.set("i", "<C-h>", "<left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-l>", "<right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-k>", "<up>", { desc = "Move cursor up" })
vim.keymap.set("i", "<C-j>", "<down>", { desc = "Move cursor down" })

-- move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move whole line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move whole line up" })

-- move line below to current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- center cursor when moving with C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer" })

-- paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste overwrite" })

-- delete without overwriting register
vim.keymap.set(
    { "n", "v" },
    "<leader>d",
    [["_d]],
    { desc = "Delete overwrite" }
)

-- make current file executeable
vim.keymap.set(
    "n",
    "<leader>x",
    "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Make E[x]ecutable" }
)
