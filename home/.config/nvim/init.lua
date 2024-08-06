require 'plugins'
require 'local' -- Local settings specific to this host/system/wm/machine. In my case tracked in a separate homeshick repo - .macos, .sway, etc.
require 'statusline'

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

        toggle_style_key = '<leader>ts',
        toggle_style_list = { 'light', 'dark', 'darker',  'warm', 'warmer', 'cool', 'deep' },
    }
    require('onedark').load()
    vim.cmd[[colorscheme onedark]] -- not needed with this plugin
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
    
    
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true }) 
