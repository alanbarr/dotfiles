set nocompatible                "use vim settings over vi

"sort out colour schemes for gvim and vim
if has("gui_running")
    colo wombat
    set guifont=Source\ Code\ Pro\ Medium\ 9
else
    set t_Co=256
    colorscheme wombat256mod
endif

set shiftwidth=4                "Indent is 4 spaces
set tabstop=4                   "Tab is 4 spaces
set softtabstop=4
set expandtab                   "Tabs to spaces
set smarttab
set autoindent                  "Keep same indent when no filtype specific
"set smartindent
set cindent
set number                      "Line numbers on
set hls                         "Search highlighting on
set showmatch                   "Highlight matching braces
set ruler                       "Always show cursor position
set backspace=indent,eol,start  "Allow backspacing over everything in insert mode

"set virtualedit=all             "Cursor can move anywhere
set guioptions-=T               "Removes toolbar
set vb t_vb=                    "Disables warning
set incsearch                   "Starts searching as soon as you type

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set visualbell                  "Flash instead of beep

" Open vsplits on the right
set splitright
" Open splits below
set splitbelow

"allows access to sudo permissions in vim
cmap w!! w !sudo tee % >/dev/null

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set mousemodel=popup_setpos
endif

set textwidth=80               "wraps text

"Auto text wrap off.
set formatoptions-=t

"Spelling : Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

"Used for id utils
"map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
"map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>
"
"function! ID_search()
"  let g:word = expand("<cword>")
"  let x = system("lid --key=none ". g:word)
"  let x = substitute(x, "\n", " ", "g")
"  execute "next " . x
"endfun

"Convenience
imap jj <Esc>

"File specific options
syntax on
filetype on
filetype plugin on
filetype indent on "XXX consider removing
"if has ("autocmd")
"    autocmd Filetype make set noexpandtab
"    autocmd Filetype c set cindent
"endif

if exists('+colorcolumn')
    set colorcolumn=81
    "highlight ColorColumn ctermbg=magenta
    " following should only mark lines with overflow
    "call matchadd('ColorColumn', '\%80v', 100)
else
    augroup vimrc_autocmds
        "autocmd VimEnter * autocmd WinEnter * let w:created=1
        "autocmd WinEnter * if !exists('w:created')
        "endif
        highlight OverLength ctermbg=darkgrey guibg=#111111
        autocmd BufEnter * match OverLength /\%80v.\+/
        autocmd WinEnter * match OverLength /\%80v.\+/
    augroup END
endif

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Airline Configuration
set laststatus=2

" TagBar Configuration
map <leader>t :TagbarToggle<CR>

" NERDTree Configuration
map <leader>n :NERDTreeToggle<CR>

""##########
"" Damian Conway's stuff from http://is.gd/IBV2013
""=====[ Block Dragging ]=====
"    runtime plugin/dragvisuals.vim
"    "let g:DVB_TrimWS = 1
"    vmap  <expr>  <S-LEFT>   DVB_Drag('left')
"    vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
"    vmap  <expr>  <S-DOWN>   DVB_Drag('down')
"    vmap  <expr>  <S-UP>     DVB_Drag('up')
"
""=====[ Highlight matches when jumping to next ]====
"    " This rewires n and N to do the highlighing...
"    nnoremap <silent> n   n:call HLNext(0.4)<cr>
"    nnoremap <silent> N   N:call HLNext(0.4)<cr>
"
"    " OR ELSE just highlight the match in red...
"    function! HLNext (blinktime)
"        let [bufnum, lnum, col, off] = getpos('.')
"        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"        let target_pat = '\c\%#'.@/
"        let ring = matchadd('WhiteOnRed', target_pat, 101)
"        redraw
"        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"        call matchdelete(ring)
"        redraw
"    endfunction
""###########
"
