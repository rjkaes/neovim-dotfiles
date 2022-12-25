-- If we're connected to AC, then perform full autocompletion; otherwise, don't.
-- Completion takes up a bunch of power that isn't available on battery.
local always_completion = true
if vim.fn.executable('pmset') == 1 then
    always_completion = not(vim.fn.system('pmset -g batt'):find('AC Power', 1, true) == nil)
end

vim.g.coq_settings = {
    auto_start = 'shut-up',
    completion = {
        always = always_completion,
    },
    keymap = {
        recommended = false,
    },
    clients = {
        snippets = {
            warn = {},
        },
    },
}

local lsp = require "lspconfig"
local coq = require "coq"
local lsp_status = require('lsp-status')
lsp_status.config({
    status_symbol = '',
    indicator_info = 'ℹ',
    diagnostics = false,
    current_function = false,
    show_filename = false,
})
lsp_status.register_progress()

local capabilities = coq.lsp_ensure_capabilities()
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

local rubocop_command = vim.fn.expand("$HOME/bin/rubocop")
local rubocop_formatter_command = vim.fn.expand("$HOME/bin/rubocop-formatter")
local null_ls = require 'null-ls'

local vale_buffer_to_extension = function(bufname)
    -- Need to special case when dealing with mutt messages
    if string.find(bufname, "/tmp/mutt", 1, true) then
        return 'mail'
    else
        return vim.fn.fnamemodify(bufname, ":e")
    end
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    -- debug = true,
    sources = {
        -- NOTE: Completely customize vale to handle mutt which does not create
        -- files with an extension.  Use the filetype of the buffer for the
        -- extension.
        null_ls.builtins.diagnostics.vale.with({
            extra_filetypes = { "text", "mail", },
            args = function(params)
                return { "--no-exit", "--output", "JSON", "--ext", "." .. vale_buffer_to_extension(params.bufname) }
            end,
            on_output = function(params)
                local severities = { error = 1, warning = 2, suggestion = 4 }
                local output = params.output["stdin." .. vale_buffer_to_extension(params.bufname)]
                    or params.output[params.bufname]
                    or {}

                local diagnostics = {}
                for _, diagnostic in ipairs(output) do
                    table.insert(diagnostics, {
                        row = diagnostic.Line,
                        col = diagnostic.Span[1],
                        end_col = diagnostic.Span[2] + 1,
                        code = diagnostic.Check,
                        message = diagnostic.Message,
                        severity = severities[diagnostic.Severity],
                    })
                end

                return diagnostics
            end,
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

-- Use internal formatting for bindings like gq.
 vim.api.nvim_create_autocmd('LspAttach', { 
   callback = function(args) 
     vim.bo[args.buf].formatexpr = nil 
   end, 
 })

-- TODO: Need to support ameba for crystal via null-ls

require('rust-tools').setup({
    on_attach = lsp_status.on_attach,
    capabilities = capabilities,
    -- Disable proc macro as it SLOWS down rust-analyzer
    server = {
        standalone = false,
        settings = {
            ['rust-analyzer'] = {
                procMacro = {
                    attributes = {
                        enable = false,
                    },
                    enable = false
                }
            }
        }
    }
})
require("clangd_extensions").setup({
    capabilities = capabilities,
})
