return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.html.setup({})

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(event)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local mapn = function(keys, func, desc)
                        vim.keymap.set(
                            "n",
                            keys,
                            func,
                            { buffer = event.buf, desc = "LSP: " .. desc }
                        )
                    end

                    local mapnv = function(keys, func, desc)
                        vim.keymap.set(
                            { "n", "v" },
                            keys,
                            func,
                            { buffer = event.buf, desc = "LSP: " .. desc }
                        )
                    end

                    mapn(
                        "gd",
                        require("telescope.builtin").lsp_definitions,
                        "[G]oto [D]efinition"
                    )

                    mapn(
                        "gr",
                        require("telescope.builtin").lsp_references,
                        "[G]oto [R]eferences"
                    )

                    mapn(
                        "gI",
                        require("telescope.builtin").lsp_implementations,
                        "[G]oto [I]mplementation"
                    )

                    mapn(
                        "<leader>gt",
                        require("telescope.builtin").lsp_type_definitions,
                        "[G]oto [T]ype"
                    )

                    mapn(
                        "<leader>ds",
                        require("telescope.builtin").lsp_document_symbols,
                        "[D]ocument [S]ymbols"
                    )

                    mapn(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    mapn("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                    mapnv(
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        "[C]ode [A]ction"
                    )

                    mapn("K", vim.lsp.buf.hover, "Hover Documentation")

                    --  for example, in C this would take you to the header
                    mapn("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- see `:help CursorHold` for information about when this is executed
                    local client =
                        vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client.server_capabilities.documentHighlightProvider
                    then
                        vim.api.nvim_create_autocmd(
                            { "CursorHold", "CursorHoldI" },
                            {
                                buffer = event.buf,
                                callback = vim.lsp.buf.document_highlight,
                            }
                        )

                        vim.api.nvim_create_autocmd(
                            { "CursorMoved", "CursorMovedI" },
                            {
                                buffer = event.buf,
                                callback = vim.lsp.buf.clear_references,
                            }
                        )
                    end
                end,
            })
        end,
    },
}
