vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = true,
    },
    clients = {
        snippets = {
            warn = {},
        },
    },
}

local lsp = require "lspconfig"
local coq = require "coq"

local capabilities = coq.lsp_ensure_capabilities()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local rubocop_command = vim.fn.expand("$HOME/bin/rubocop")
local rubocop_formatter_command = vim.fn.expand("$HOME/bin/rubocop-formatter")
local null_ls = require 'null-ls'
null_ls.setup({
    -- debug = true,
    sources = {
        null_ls.builtins.diagnostics.vale.with({
            extra_filetypes = { "text" },
        }),
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.crystal_format,
        null_ls.builtins.formatting.rustfmt,

        null_ls.builtins.diagnostics.rubocop.with({
            command = rubocop_command,
        }),
        -- Only perform layout (and not full auto-correction)
        null_ls.builtins.formatting.rubocop.with({
            command = rubocop_formatter_command,
            args = { "--fix-layout", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
        }),
    },

    -- -- Formatting on save (sync)
    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 -- vim.lsp.buf.formatting_sync({}, 10000)
    --                 vim.lsp.buf.formatting()
    --             end,
    --         })
    --     end
    -- end,
})

-- TODO: Need to support ameba for crystal via null-ls

require('rust-tools').setup({
    capabilities = capabilities,
})
require("clangd_extensions").setup({
    capabilities = capabilities,
})
