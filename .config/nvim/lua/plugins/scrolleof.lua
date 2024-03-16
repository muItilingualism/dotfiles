return {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
    config = function()
        require("scrollEOF").setup({
            insert_mode = true,
        })
    end,
}
