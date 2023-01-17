return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function(plugin)
            local telescope = require('telescope')

            telescope.setup({
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
                },
            })

            telescope.load_extension('fzf')
        end,
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
}
