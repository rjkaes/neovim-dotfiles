return {
    { 'hrsh7th/cmp-nvim-lsp', branch = 'main' },
    { 'hrsh7th/cmp-buffer', branch = 'main' },
    { 'hrsh7th/cmp-path', branch = 'main' },
    {
        'hrsh7th/nvim-cmp',
        branch = 'main',
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    -- REQUIRED by nvim-cmp. get rid of it once we can
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                }),
                sources = cmp.config.sources({
                    -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }, {
                        { name = 'path' },
                    }),
                experimental = {
                    ghost_text = true,
                },
            })

            -- Enable completing paths in :
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                })
            })

        end,
    },
    { 'ray-x/lsp_signature.nvim' },

    -- Only because nvim-cmp _requires_ snippets },
    { 'hrsh7th/cmp-vsnip', branch = 'main' },
    { 'hrsh7th/vim-vsnip' },
}
