return {
    {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        init = function()
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
        end,
    },
}
