return {
    'mhartington/formatter.nvim',
    config = function()
        require("formatter").setup {
        -- logging = true,
        -- log_level = vim.log.levels.DEBUG,

        filetype = {
            javascript = {
                require("formatter.filetypes.javascript").prettier,
            },
            cs = {
                function()
                    return {
                        exe = "dotnet",
                        args = {
                            "csharpier",
                        },
                        stdin = true,
                    }
                end,
            },
            html = {
                require("formatter.filetypes.html").prettier,
            },
            ruby = {
                require("formatter.filetypes.ruby").standardrb,
            },
            rust = {
                require("formatter.filetypes.rust").rustfmt,
            },
            sql = {
                function()
                    return {
                        exe = "sqlformat",
                        args = {
                            "-k", "upper", "-r", "-s", "-",
                        },
                        stdin = true,
                    }
                end,

            },
            -- Use the special "*" filetype for defining formatter configurations on
            -- any filetype
            ["*"] = {
                -- "formatter.filetypes.any" defines default configurations for any
                -- filetype
                require("formatter.filetypes.any").remove_trailing_whitespace
            },
        },
    }
    end,
}
