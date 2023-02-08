local on_attach = function(_, bufnr)
end

local servers = {
    rust_analyzer = {},
    sumneko_lua = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- Create a new table with JUST the keys from `servers` to pass into LSP setup.
local n = 0
local ensure_installed = {}
for k, _ in pairs(servers) do
    n = n + 1
    ensure_installed[n] = k
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
                    local capabilities = vim.lsp.protocol.make_client_capabilities()

                    lsp.setup({
                        ensure_installed = ensure_installed,
                        automatic_installation = true,
                    })

                    lsp.setup_handlers {
                        function(server_name)
                            require('lspconfig')[server_name].setup {
                                capabilities = capabilities,
                                on_attach = on_attach,
                                settings = servers[server_name],
                            }
                        end
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
            { 'j-hui/fidget.nvim', config = true },

            -- -- Additional lua configuration, makes nvim stuff amazing
            -- 'folke/neodev.nvim',
        },
    },
}
