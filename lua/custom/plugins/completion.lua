return {
    { 'hrsh7th/cmp-nvim-lsp', branch = 'main' },
    { 'hrsh7th/cmp-buffer', branch = 'main' },
    { 'hrsh7th/cmp-cmdline', branch = 'main' },
    { 'onsails/lspkind.nvim' },
    {
        'hrsh7th/nvim-cmp',
        branch = 'main',
        config = function()
            vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

            local lspkind = require('lspkind')
            local cmp = require('cmp')
            cmp.setup({
                performance = {
                    debounce = 100,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol', -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    })
                },
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
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
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
                sources = cmp.config.sources(
                    {
                        -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
                        { name = 'nvim_lsp' },
                    },
                    {
                        {
                            name = 'buffer',
                            option = {
                                get_bufnrs = function()
                                    return vim.api.nvim_list_bufs()
                                end
                            },
                        },
                    }),
                experimental = {
                    ghost_text = true,
                },
            })

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })

        end,
    },
    { 'ray-x/lsp_signature.nvim' },

    -- Only because nvim-cmp _requires_ snippets },
    { 'hrsh7th/cmp-vsnip', branch = 'main' },
    { 'hrsh7th/vim-vsnip' },
}
