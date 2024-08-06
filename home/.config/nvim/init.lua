require 'plugins'
require 'local' -- Local settings specific to this host/system/wm/machine. In my case tracked in a separate homeshick repo - .macos, .sway, etc.
require 'statusline'

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
