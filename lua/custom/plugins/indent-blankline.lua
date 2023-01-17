-- Show indentation
return {
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            show_first_indent_level = false,
            space_char_blankline = " ",
            show_current_context = false,
            filetype_exclude = {"help"},
            buftype_exclude = {"terminal"},
        },
    },
}
