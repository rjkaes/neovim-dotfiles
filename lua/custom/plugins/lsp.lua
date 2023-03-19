local on_attach = function(_, bufnr)
end

local setup_lua_ls = function(capabilities)
    require('lspconfig').lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
            },
        }
    }
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    local lsp = require("mason-lspconfig")
                    local capabilities = require('cmp_nvim_lsp').default_capabilities()

                    lsp.setup({
                        ensure_installed = { 'lua_ls' },
                        automatic_installation = true,
                    })

                    lsp.setup_handlers {
                        function(server_name)
                            require('lspconfig')[server_name].setup {
                                capabilities = capabilities,
                                on_attach = on_attach,
                            }
                        end,
                        ['lua_ls'] = setup_lua_ls(capabilities),
                    }

                    vim.diagnostic.config {
                        -- Don't update LSP within insert.  Wait until normal mode.
                        update_in_insert = false,
                        severity_sort = true,
                    }

                    local signs = {
                        Error = '',
                        Warn = '',
                        Hint = '',
                        Info = 'ⓘ',
                    }
                    for type, icon in pairs(signs) do
                        local hl = 'DiagnosticSign' .. type
                        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
                    end
                end,
            },

            -- Useful status updates for LSP
            {
                'j-hui/fidget.nvim',
                opts = {
                    window = {
                        blend = 0,
                    },
                },
            },


            -- -- Additional lua configuration, makes nvim stuff amazing
            -- 'folke/neodev.nvim',
        },
    },
}
