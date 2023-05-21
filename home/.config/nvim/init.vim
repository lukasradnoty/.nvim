""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins from ~/.local/share/nvim/site/pack/vendor/opt
" (the opt is a symlink to ~/.homesick/repos/nvim/vendor).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " https://github.com/tpope/vim-commentary
    " <gcc> comment/uncomment
    " <gc> comment/uncomment a motion
    packadd commentary

    " Plugins excluded from VSCode
    if !exists('g:vscode')
	" https://github.com/sheerun/vim-polyglot
	" Language packs
	packadd polyglot

        " https://github.com/junegunn/goyo.vim
        " Distraction-free writing
        " :Goyo Toggle Goyo
        " :Goyo [dimension] Turn on or resize Goyo
        " :Goyo! Turn Goyo off
        packadd goyo

        " https://github.com/junegunn/limelight.vim
        " Focus on paragraph/block
        " Limelight [0.0 ~ 1.0] Turn Limelight on
        " Limelight! Turn Limelight off
        " Limelight!! [0.0 ~ 1.0] Toggle Limelight
        packadd limelight
	
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
	packadd indentline
	" let g:indentLine_char = '|'
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']
	
	" packadd indent-blankline
	
	" https://github.com/tpope/vim-endwise
	packadd endwise
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
" Line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set number

    " Relative numbers for lines other than the current line
    set relativenumber

" Enable mouse in all modes
set mouse=a

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " One fullwidth statusline independent of the number of panes
    set laststatus=3

    " Statusline contents
    set stl=
    " set stl+=%{fugitive#statusline()}
    " File name
    set stl+=%f
    " Do we have unsaved changes (modified) [flag]
    set stl+=%m
    " Is this open in read only mode [flag]
    set stl+=%r
    " Is this open in preview mode [flag]
    set stl+=%w
    " Is this help buffer
    " set stl+=%H
    " Full path of the file
    " set stl+=\ %F
    " File nama tail
    set stl+=\ %t
    " TRUNCATE THE STATUSLINE HERE if it's too wide (BOL by default)
    " set stl+=%<
    " Window number
    " set stl+=\ %{winnr()}
    " SEPARATION POINT
    set stl+=%=
    " Argument list status
    set stl+=\ %a
    " Warning if file format is not unix
    set stl+=%#warningmsg#
    set stl+=%{&ff!='unix'?'['.&ff.']':''}
    set stl+=%*
    " Warning if file encoding is not utf-8
    set stl+=%#warningmsg#
    set stl+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set stl+=%*
    " SEPARATION POINT
    set stl+=%=
    " Buffer number
    set stl+=\ Buf:%n
    " Line %l (of %L), Col %c (alternatively %v)
    set stl+=\ Ln:%l(of\ %L)\ Col:%c
    " Percent of file - above the viewport
    " set stl+=\ %P
    " Percent of file - line
    " set stl+=\ %p%%
    " File format
    " set stl+=\ %{&ff}
    " File encoding
    " set stl+=\ %{&fileencoding?&fileencoding:&encoding}
    " set stl+=\ %{strlen(&fenc)?&fenc:'none'}
    " File type (language)
    set stl+=\ %Y
