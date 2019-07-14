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

" Auto text wrap off.
set formatoptions-=t
" Remove a comment leader when joining lines.
set formatoptions+=j

"Spelling : Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

"Convenience
imap jj <Esc>

" C Function Argument Alignment
set cino=(0

"File specific options
syntax on
filetype on
filetype plugin on
filetype indent on "XXX consider removing

if exists('+colorcolumn')
    set colorcolumn=81
else
    augroup vimrc_autocmds
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


autocmd BufNewFile,BufRead *.txt   call EditingText()
autocmd BufNewFile,BufRead *.ascii call EditingText()

function EditingText()
    set formatoptions+=t
    set nocindent
endfunction

" Show trailing whitespace
set list
set listchars=trail:~
set listchars+=tab:>-

" Clang Format
if has('python')
map  <leader>cf      :pyf ~/dotfiles/clang/clang-format.py<cr>
imap <leader>cf <c-o>:pyf ~/dotfiles/clang/clang-format.py<cr>
elseif has('python3')
map  <leader>cf      :py3f ~/dotfiles/clang/clang-format.py<cr>
imap <leader>cf <c-o>:py3f ~/dotfiles/clang/clang-format.py<cr>
endif
