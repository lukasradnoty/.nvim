-- Load plugins manually from ~/.local/share/nvim/site/pack/*/opt/
-- vim.cmd [[packadd vim-commentary]]

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- https://github.com/tpope/vim-commentary
    -- <gcc> comment/uncomment
    -- <gc> comment/uncomment a motion
    use 'tpope/vim-commentary'
    
    
    -- https://github.com/junegunn/goyo.vim
    -- Distraction-free writing
    -- :Goyo Toggle Goyo
    -- :Goyo [dimension] Turn on or resize Goyo
    -- :Goyo! Turn Goyo off
	use 'junegunn/goyo.vim'

    -- https://github.com/junegunn/limelight.vim
    -- Focus on paragraph/block
    -- Limelight [0.0 ~ 1.0] Turn Limelight on
    -- Limelight! Turn Limelight off
    -- Limelight!! [0.0 ~ 1.0] Toggle Limelight
	use 'junegunn/limelight.vim'

	-- https://github.com/neoclide/coc.nvim
	use{ 'neoclide/coc.nvim', branch = 'release' }
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

	-- https://github.com/Yggdroot/indentLine
	-- Indentation lines
	-- vim.g.indentLine_char = '|'
	-- vim.g.indentLine_char_list = ['|', '¦', '┆', '┊']
	-- use 'Yggdroot/indentLine'

    -- https://github.com/lukas-reineke/indent-blankline.nvim
    -- Indentation lines
	use 'lukas-reineke/indent-blankline.nvim'
    
    -- Colorcolumn
    use {
        'https://github.com/lukas-reineke/virt-column.nvim',
        config = function()
            require("virt-column").setup {
                char = '┆', -- | ¦ ┆ ┊
                -- You use this instead of colorcolumn, or in
                -- addition to it
                virtcolumn = '79'
            }
        end
    }

	-- `end`s
	use 'https://github.com/tpope/vim-endwise'

	-- Language packs
	use 'https://github.com/sheerun/vim-polyglot'
    
    use {
        'https://github.com/nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
          require("nvim-tree").setup {}
          vim.api.nvim_set_keymap("n", "<C-[>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
        end
    }

    -- Theme
    use 'https://github.com/folke/tokyonight.nvim'
end)

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight-storm]]
-- vim.cmd[[colorscheme tokyonight-day]]
-- vim.cmd[[colorscheme tokyonight-moon]]

-- Config bellow this doesn't apply to VSCode
-- if vim.g.vscode then
--     do
--         return
--     end
-- end

vim.opt.termguicolors = true

-- Line numbers
    vim.opt.number = true
    -- Relative numbers for lines other than the current line
    vim.opt.relativenumber = true
    
-- Line highlighting
    vim.opt.cursorline = true

    -- Toggle it in insert mode
    vim.cmd [[autocmd InsertEnter * set nocursorline]]
    vim.cmd [[autocmd InsertLeave * set cursorline]]
    
-- Line wrapping
--
-- Unfortunately, soft-wrapping at a column is not possible
-- in vim
-- https://app.bountysource.com/issues/31502625-softwrap-at-arbitrary-boundary
--
    -- Highlight column
    -- vim.opt.colorcolumn = '79' -- for some reason this has to be a string
    -- vim.cmd [[highlight ColorColumn ctermbg=lightgray]]

    -- Hard-wrap
    -- FIX:
    -- vim.g.formatoptions = '+t'
    -- vim.opt.textwidth = 79

    -- Soft-wrap on a word level instead of just continuing
    -- on the next line when you hit the right edge
    vim.g.linebreak = true

    -- Indent after a wrap
    -- vim.g.breakindent = true

-- Turn off highlighting matching parentheses
-- (Turn on with :DoMatchParen)
    vim.cmd [[autocmd VimEnter * NoMatchParen]]
    
-- Mouse: enable in all modes
    vim.opt.mouse = 'a'
    
-- Terminal
    -- Exit terminal insert mode by hitting Esc twice
    vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-n>")

    -- No line numbers in terminal
	vim.cmd [[autocmd TermOpen term://* set nonumber norelativenumber]]

    -- Open straight into insert mode
	vim.cmd [[autocmd TermOpen term://* startinsert]]
    
-- Statusline
    local function statusline()
        local filename = '%f'
        local flag_changes = '%m'
        local flag_ro_mode = '%r'
        local flag_preview_mode = '%w'
        local flag_help_buffer = '%H'
        local filepath = '%F'
        local filetail = '%t'
        local truncate_point = '%<' -- (BOL by default)
        local window_number = ' %{winnr()}'
        local separation_point = '%='
        local argument_list_status = '%a'
        local buffer_number = '%n'
        local fileformat = '%{&ff}'
        local filetype = '%y'
        local above_viewport_window = '%P'
        local above_viewport_lines = '%p%%'
        local encoding = "%{&fileencoding?&fileencoding:&encoding}"
        local line_current = '%l'
        local line_total = '%L'
        local column = '%c' -- or %v
        local fugitive = '%{fugitive#statusline()}'
        local warning_file_not_unix = "%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*"
        local warning_file_not_utf8 = "%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*"
        
        local left = ''
        -- .. fugitive
        .. filename
        .. flag_changes
        .. flag_ro_mode
        .. flag_preview_mode
        .. flag_help_buffer
        -- .. filepath
        -- .. filetail

        local center = truncate_point .. separation_point
        .. argument_list_status
        .. warning_file_not_unix
        .. warning_file_not_utf8


        local right = '' .. separation_point
        -- .. window_number
        .. string.format('Buf:%s', buffer_number)
        .. string.format(' Ln:%s(%s)', line_current, line_total)
        .. string.format(' Col:%s', column)
        -- .. above_viewport_window
        -- .. above_viewport_lines
        -- .. fileformat
        -- .. encoding
        .. string.format(' %s', filetype)

        return left .. center .. right
    end
    vim.opt.statusline = statusline()

    -- Single fullwidth statusline,
    -- even with multiple panes open
    vim.opt.laststatus = 3
    