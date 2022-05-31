-- Setup status line
require('lualine').setup({
    options = {
        theme = 'OceanicNext',
        -- theme = 'powerline',
        -- theme = 'papercolor_light',
    },

    sections = {
        lualine_b = {
            'diff',
            {
                'diagnostics',
                sources = { 'ale' },
                colored = false,
            },
        },
        lualine_c = {
            {
                'filename',
                path = 1,
                shorten_target = 20,
            },
        },
        lualine_x = { 'encoding', 'filetype' },
    },
})

require("indent_blankline").setup {
    show_first_indent_level = false,
    space_char_blankline = " ",
    show_current_context = true,
    filetype_exclude = {"help"},
    buftype_exclude = {"terminal"},
}

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '!', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    current_line_blame = false,
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

        -- Actions
        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        map('n', '<leader>htb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
        map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
        map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        map('n', '<leader>htd', '<cmd>Gitsigns toggle_deleted<CR>')

        -- Text object
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
}

local telescope = require 'telescope'
telescope.setup {
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}
telescope.load_extension('fzf')

require("toggleterm").setup{
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    direction = 'vertical',
}

require('neogit').setup {}

-- Setup lspconfig.
local lspconfig = require'lspconfig'
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = { 'rust_analyzer' }
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
            on_attach = on_attach,
            flags = {
                -- This will be the default in neovim 0.7+
                debounce_text_changes = 150,
            }
        }
    end

    -- Get signatures (and _only_ signatures) when in argument lists.
    require "lsp_signature".on_attach({
        doc_lines = 0,
        handler_opts = {
            border = "none"
        },
    })
end

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})
