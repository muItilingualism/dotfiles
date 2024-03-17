return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():append()
        end, { desc = "[A]ppend file to harpoon list" })
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open Harpoon" })

        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon 1" })
        vim.keymap.set("n", "<C-j>", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon 2" })
        vim.keymap.set("n", "<C-k>", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon 3" })
        vim.keymap.set("n", "<C-l>", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon 4" })
    end,
}
