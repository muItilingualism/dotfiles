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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup(
                    "kickstart-lsp-attach",
                    { clear = true }
                ),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set(
                            "n",
                            keys,
                            func,
                            { buffer = event.buf, desc = "LSP: " .. desc }
                        )
                    end

                    map(
                        "gd",
                        require("telescope.builtin").lsp_definitions,
                        "[G]oto [D]efinition"
                    )

                    map(
                        "gr",
                        require("telescope.builtin").lsp_references,
                        "[G]oto [R]eferences"
                    )

                    map(
                        "gI",
                        require("telescope.builtin").lsp_implementations,
                        "[G]oto [I]mplementation"
                    )

                    map(
                        "<leader>gt",
                        require("telescope.builtin").lsp_type_definitions,
                        "[G]oto [T]ype"
                    )

                    map(
                        "<leader>ds",
                        require("telescope.builtin").lsp_document_symbols,
                        "[D]ocument [S]ymbols"
                    )

                    map(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                    map(
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        "[C]ode [A]ction"
                    )

                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    --  for example, in C this would take you to the header
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

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
