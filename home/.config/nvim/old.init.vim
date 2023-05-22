""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins from ~/.local/share/nvim/site/pack/vendor/opt
" (the opt is a symlink to ~/.homesick/repos/nvim/vendor).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " https://github.com/tpope/vim-commentary
    " <gcc> comment/uncomment
    " <gc> comment/uncomment a motion
    packadd vim-commentary

    " Plugins excluded from VSCode
    if !exists('g:vscode')
	" https://github.com/sheerun/vim-polyglot
	" Language packs
	packadd vim-polyglot

        " https://github.com/junegunn/goyo.vim
        " Distraction-free writing
        " :Goyo Toggle Goyo
        " :Goyo [dimension] Turn on or resize Goyo
        " :Goyo! Turn Goyo off
        packadd goyo.vim

        " https://github.com/junegunn/limelight.vim
        " Focus on paragraph/block
        " Limelight [0.0 ~ 1.0] Turn Limelight on
        " Limelight! Turn Limelight off
        " Limelight!! [0.0 ~ 1.0] Toggle Limelight
        packadd limelight.vim
	
	" https://github.com/neoclide/coc.nvim -b release
	packadd coc
	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice.
	inoremap <silent><expr> <TAB>
	      \ coc#pum#visible() ? coc#pum#next(1) :
	      \ CheckBackspace() ? "\<Tab>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice.
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
				      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" https://github.com/Yggdroot/indentLine
	" Indentation lines
	"packadd indentline
	" let g:indentLine_char = '|'
	"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	
	" packadd indent-blankline
	
	" https://github.com/tpope/vim-endwise
	packadd vim-endwise
    endif


" No config after this doesn't apply to both Neovim and VSCode
if exists('g:vscode')
    finish
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrapping
"
" Unfortunately, soft-wrapping at a column is not possible
" in vim
" https://app.bountysource.com/issues/31502625-softwrap-at-arbitrary-boundary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Highlight column
    set colorcolumn=79
    highlight ColorColumn ctermbg=lightgray

    " Hard-wrap
    " set formatoptions+=t | set textwidth=79

    " Soft-wrap on a word level instead of just continuing
    " on the next line when you hit the right edge
    " (`set wrap` if it isn't by default)
    set linebreak

    " Indent after a wrap
    " set breakindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Exit terminal by hitting Esc twice
    tnoremap <Esc><Esc> <C-\><C-n>

    " No line numbers in terminal
	autocmd TermOpen term://* set nonumber norelativenumber

    " Open straight into insert mode
	autocmd TermOpen term://* startinsert

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting the current line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Higlight current line
    set cursorline

    " Turn off highlight when in insert mode
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline

" Don't hightlight matching parentheses
" (Turn on with :DoMatchParen)
autocmd VimEnter * NoMatchParen