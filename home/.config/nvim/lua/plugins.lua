-- To load plugins manually from ~/.local/share/nvim/site/pack/*/opt/
-- vim.cmd [[packadd vim-commentary]]

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.uv.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end
bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')


require('pckr').add{
    -- Comments
    -- <gcc> comment/uncomment
    -- <gc> comment/uncomment a motion
    'https://github.com/tpope/vim-commentary';
    

    -- Distraction-free writing
    -- :Goyo Toggle Goyo
    -- :Goyo [dimension] Turn on or resize Goyo
    -- :Goyo! Turn Goyo off
    'https://github.com/junegunn/goyo.vim',

    -- Focus on paragraph/block
    -- Limelight [0.0 ~ 1.0] Turn Limelight on
    -- Limelight! Turn Limelight off
    -- Limelight!! [0.0 ~ 1.0] Toggle Limelight
    'https://github.com/junegunn/limelight.vim',

    -- COC
    -- { 'https://github.com/neoclide/coc.nvim', branch = 'release' };

    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice.
    -- inoremap <silent><expr> <TAB>
    --       \ coc#pum#visible() ? coc#pum#next(1) :
    --       \ CheckBackspace() ? "\<Tab>" :
    --       \ coc#refresh()
    -- inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice.
    -- inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
    -- 			      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    -- Use <c-space> to trigger completion.
    -- inoremap <silent><expr> <c-space> coc#refresh()

    -- Indentation lines
    { 'https://github.com/lukas-reineke/indent-blankline.nvim', };

    -- Colorcolumn
    {
        'https://github.com/lukas-reineke/virt-column.nvim',
        config = function()
            require("virt-column").setup {
                char = '┆', -- | ¦ ┆ ┊
                -- You use this instead of colorcolumn, or in
                -- addition to it
                virtcolumn = '79'
            }
        end
    };

    -- `end`s
    'https://github.com/tpope/vim-endwise';

    -- Language packs
    'https://github.com/sheerun/vim-polyglot';

    -- File explorer
    {
        'https://github.com/nvim-tree/nvim-tree.lua',
        requires = {
            'https://github.com/nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
            vim.api.nvim_set_keymap("n", "<C-[>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
        end
    };

    -- Transparent backgrounds
    -- 'https://github.com/xiyaowong/transparent.nvim'

    -- Colorscheme
    'navarasu/onedark.nvim'; --sway
}

