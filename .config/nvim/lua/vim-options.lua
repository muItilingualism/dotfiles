-- enable nerd font
vim.g.have_nerd_font = true

-- force 4 spaces for indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- leader
vim.g.mapleader = " "

-- one clipboard to rule them all
vim.cmd("set clipboard+=unnamedplus")

-- fat cursor
vim.opt.guicursor = ""

-- relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- show line numbers
vim.opt.number = true

-- minimum number of lines above or below cursor
vim.opt.scrolloff = 8

-- show the line the cursor is one
vim.opt.cursorline = true

-- fast
vim.opt.updatetime = 50

-- 80 or death
vim.opt.colorcolumn = "80"

-- u smart
vim.opt.smartindent = true

-- highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
