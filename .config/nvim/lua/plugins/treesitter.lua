return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "rust", "typescript", "javascript", "html" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}