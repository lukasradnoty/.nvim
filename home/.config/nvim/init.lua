-- Load plugins manually from ~/.local/share/nvim/site/pack/*/opt/
-- vim.cmd [[packadd vim-commentary]]

require('packer').startup(function(use)
    -- Comments
    -- <gcc> comment/uncomment
    -- <gc> comment/uncomment a motion
    use 'https://github.com/tpope/vim-commentary'

    -- Distraction-free writing
    -- :Goyo Toggle Goyo
    -- :Goyo [dimension] Turn on or resize Goyo
    -- :Goyo! Turn Goyo off
    use { 'https://github.com/junegunn/goyo.vim',
        cond = [[not vim.g.vscode]]
    }

    -- Focus on paragraph/block
    -- Limelight [0.0 ~ 1.0] Turn Limelight on
    -- Limelight! Turn Limelight off
    -- Limelight!! [0.0 ~ 1.0] Toggle Limelight
    use { 'https://github.com/junegunn/limelight.vim',
        cond = [[not vim.g.vscode]]
    }

    -- COC
    use{ 'https://github.com/neoclide/coc.nvim', branch = 'release',
        cond = [[not vim.g.vscode]]
    }

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
    use { 'https://github.com/lukas-reineke/indent-blankline.nvim',
        cond = [[not vim.g.vscode]]
    }

    -- Colorcolumn
    use {
        'https://github.com/lukas-reineke/virt-column.nvim',
        cond = [[not vim.g.vscode]],
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
    use { 'https://github.com/sheerun/vim-polyglot',
        cond = [[not vim.g.vscode]]
    }

    -- File explorer
    use {
        'https://github.com/nvim-tree/nvim-tree.lua',
        cond = [[not vim.g.vscode]],
        requires = {
            'https://github.com/nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
            vim.api.nvim_set_keymap("n", "<C-[>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
        end
    }

    -- Transparent backgrounds
    -- use 'https://github.com/xiyaowong/transparent.nvim'

    -- Colorscheme
    use 'navarasu/onedark.nvim' --sway
end)

-- Onedark colorschcme for my archlinux+sway setup
if vim.fn.hostname() == "x260-archlinux" then 
    -- If you don't set this to dark and onedark style is of the dark group of colors,
    -- it will default to light.
    vim.opt.background = 'light'
    require('onedark').setup {
        style = 'light', -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'

        transparent = true,
        term_colors = true,
        ending_tildes = true,

        -- toggle_style_key = '<leader>ts',
        -- toggle_style_list = { 'light', 'dark', 'darker',  'warm', 'warmer', 'cool', 'deep' },
    }
    require('onedark').load()
    -- vim.cmd[[colorscheme onedark]] -- not needed with this plugin
end


-- vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })

-- vim.cmd[[colorscheme default]]
-- vim.cmd[[colorscheme flexoki-dark]]
-- vim.opt.termguicolors = true -- not compatible with pywal! 
-- vim.opt.termguicolors = false -- its either true by default or somethings sets it to true

-- Config bellow this doesn't apply to VSCode
-- if vim.g.vscode then
--     do
--         return
--     end
-- end

-- Line numbers
    vim.opt.number = true
    -- Relative numbers for lines other than the current line
    vim.opt.relativenumber = true
    
-- Line highlighting
    -- vim.opt.cursorline = true

    -- Toggle it in insert mode
    -- vim.cmd [[autocmd InsertEnter * set nocursorline]]
    -- vim.cmd [[autocmd InsertLeave * set cursorline]]
    
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
    
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true }) 
