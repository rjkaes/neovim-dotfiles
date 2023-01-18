local rubocop_command = vim.fn.expand("$HOME/bin/rubocop")
local rubocop_formatter_command = vim.fn.expand("$HOME/bin/rubocop-formatter")

local vale_buffer_to_extension = function(bufname)
    -- Need to special case when dealing with mutt messages
    if string.find(bufname, "/tmp/mutt", 1, true) then
        return 'mail'
    else
        return vim.fn.fnamemodify(bufname, ":e")
    end
end

return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                on_attach = function(_client, bufnr)
                    -- Disable LSP formatexpr (use the internal one)
                    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', '')
                end,
                -- debug = true,
                sources = {
                    -- NOTE: Completely customize vale to handle mutt which does not create
                    -- files with an extension.  Use the filetype of the buffer for the
                    -- extension.
                    null_ls.builtins.diagnostics.vale.with({
                        extra_filetypes = { "text", "mail", },
                        args = function(params)
                            return { "--config=" .. vim.fn.expand("$HOME/.vale.ini"), "--no-exit", "--output", "JSON", "--ext", "." .. vale_buffer_to_extension(params.bufname) }
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
            })
        end,
    },
}
