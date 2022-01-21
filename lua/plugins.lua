-- Load up all the plugins and initialize them
local packer = nil
local function init()
    if packer == nil then
        packer = require('packer')
    end

    packer.init({
            compile_path = require('packer.util').join_paths('~', '.vim_plugins_compiled', 'packer_compiled.lua'),
        })
    local use = packer.use
    packer.reset()

    use 'wbthomason/packer.nvim'

    -- -- Color scheme
    -- -- 'evansb/vim-colors-pencil';
    use { 'owickstrom/vim-colors-paramount', opt=true }
    use { 'rakr/vim-one', opt=true }
    -- -- 'rakr/vim-two-firewatch'
    -- -- 'sainnhe/sonokai';
    -- -- 'axvr/photon.vim';

    -- Replace matchit.vim and matchparen
    use 'andymass/vim-matchup'

    -- -- Telescope (fuzzy finder)
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim',
                'telescope-fzf-native.nvim',
            },
            wants = {
                'popup.nvim',
                'plenary.nvim',
                'telescope-fzf-native.nvim',
            },
            config = [[require('config.telescope')]],
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
        },
    }

    -- -- A bunch of Tim Pope plugins to make using vim easier
    use 'tpope/vim-sensible'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-characterize'
    use 'tpope/vim-endwise'
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use { 'tpope/vim-dispatch', opt=true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'} }
    use 'radenling/vim-dispatch-neovim'
    use 'kassio/neoterm'
    use 'janko-m/vim-test'
    use 'tommcdo/vim-fubitive'

    -- A solid language pack (a collection of language packs)
    use 'sheerun/vim-polyglot'

    -- Async linting engine
    use 'dense-analysis/ale'

    -- -- Ruby
    use { 'ruby-formatter/rufo-vim', opt=true, ft={'ruby', 'rspec'} }
    use { 'tpope/vim-rails', opt=true, ft={'ruby', 'rspec'} }
    use { 'kana/vim-textobj-user', opt=true, ft={'ruby', 'rspec'} }
    use { 'nelstrom/vim-textobj-rubyblock', opt=true, ft={'ruby', 'rspec'} }

    -- Treesitter for syntax highlighting, etc.
    -- use  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- use 'romgrk/nvim-treesitter-context'

    -- Show indentation
    use 'lukas-reineke/indent-blankline.nvim'

    -- Git
    use {
      { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gcheckout', 'Gvdiffsplit', 'Gmove', 'Gremove', 'Gwrite' } },
      {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = [[require('config.gitsigns')]],
      },
    }

    use { 'ms-jpq/coq_nvim', branch='coq' }

    use { 'cweagans/vim-taskpaper', opt=true, ft={'taskpaper'} }

    -- LISP editing
    use { 'kovisoft/slimv', opt=true, ft={'lisp', 'clojure'} }
end

init()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Initialize indent blanklines
require("indent_blankline").setup {
    show_first_indent_level = false,
    space_char_blankline = " ",
    show_current_context = true,
    filetype_exclude = {"help"},
    buftype_exclude = {"terminal"},
}

-- -- Initialize and configure treesitter
-- require'nvim-treesitter.configs'.setup {
--     ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--     highlight = {
--         enable = true,              -- false will disable the whole extension
--         --- disable = { "c", "rust" },  -- list of language that will be disabled
--         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--         -- Using this option may slow down your editor, and you may see some duplicate highlights.
--         -- Instead of true it can also be a list of languages
--         additional_vim_regex_highlighting = false,
--     },
--     matchup = {
--         enable = true,
--     },
-- }

-- require'treesitter-context'.setup{
--     enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--     throttle = true, -- Throttles plugin updates (may improve performance)
-- }
