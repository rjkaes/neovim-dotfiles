local read_file = function(path)
    local file = io.open(path, "r")
    if not file then return nil end
    local content = file:read()
    file:close()
    return content
end

-- Read in the current background mode and set the background theme (default to
-- "light".)  Relies on the environment variable set by `bin/setbg`
local background_color = function()
    return read_file(vim.fn.expand("$HOME/CloudStation/current_background_mode")) or 'light'
end

vim.opt.background = background_color()

local color_theme_mappings = { light = 'OceanicNext', dark = 'tokyonight' }
local_color_theme = color_theme_mappings[vim.o.background]

return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        opts = {
            options = {
                theme = local_color_theme,
            },

            sections = {
                lualine_b = {
                    'diff',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp', 'nvim_diagnostic' },
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
        },

    },
}
