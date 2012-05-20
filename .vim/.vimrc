"-------------------------------------------------------------------------------
" Basic settings
set nocompatible        " OFF the compatibility mode (vi)

" NeoBundle settings

filetype off
set rtp+=~/dotfiles/.vim/bundle/neobundle.vim/
call neobundle#rc()

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Align'

filetype plugin on

set number              " display line number
set title               " set title at titlebar
set fileencoding=utf-8  " utf-8
set shortmess+=I        " file message format
set visualbell          " flash not beep
set showmode            " display current mode  

"-------------------------------------------------------------------------------
" Backup settings
set backup
set backupdir=$HOME/tmp/vim

if has('persistent_undo') "save undo info
    set undofile
    set undodir=$HOME/tmp/vim
endif

"-------------------------------------------------------------------------------
" Color settings
syntax on               " color-coded indication
if filereadable(expand("~/dotfiles/.vim/colors/wombat.vim"))
source ~/dotfiles/.vim/colors/wombat.vim                       " wombat.vim
end

"-------------------------------------------------------------------------------
" Command settings
set history=999         " keep 999 lines of command line history
set showcmd             " display incomplete commands
set grepprg=search\ $*  " grep -> search command

"-------------------------------------------------------------------------------
" Cursor settings
set ruler                       " show the cursor position all the time
set showmatch                   " display ]})  by input [{( for a moment
set whichwrap=b,s,h,l,<,>,[,]   " don't stop at the beginning and ending of sentence
set backspace=indent,eol,start  " enable <BS> key delete autoindent space and new line code and all string

if has('multi_byte_ime') || has('xim')  " 日本語入力ON時のカーソルの色を設定
highlight CursorIM guibg=Purple guifg=NONE
endif

if has("autocmd")

autocmd FileType text setlocal textwidth=78

" move cursor last line for previous edit
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

endif " has("autocmd")

"-------------------------------------------------------------------------------
" Search settings
set ignorecase  " matches insensitively (noignorecase is sensitively)
set smartcase   " matches sensitively when upper and lower case are contained together
set incsearch   " do incremental searching
set hlsearch    " all matched letters are highlight

"-------------------------------------------------------------------------------
" Indent settings
set cindent               " always set autoindenting on
set shiftwidth=4          " auto indent by 4 spaces
set cinoptions+=:0,g0,to  " setting cindent options (0:case, g0:c++ scope, t0:functional proglang)

"-------------------------------------------------------------------------------
" Tab settings
set expandtab   " preg s/<TAB>/space
set tabstop=4   " set tab length

function InsertTabWrapper()
    if pumvisible()    " pumvisible() 6.4 NG -> 7.3 OK
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"-------------------------------------------------------------------------------
" Keybind settings
map Q gq

:inoremap <c-a>   <Home>
:inoremap <c-e>   <End>
:inoremap <c-b>   <Left>
:inoremap <c-f>   <Right>
:inoremap <c-n>   <Down>
:inoremap <c-p>   <Up>
:inoremap <c-d>   <Del>
:inoremap <c-h>   <BS>
:inoremap <c-k>   <ESC>d$i
:inoremap <c-y>   <ESC>pi

:inoremap { {}<Left>
:inoremap [ []<Left>
:inoremap ( ()<Left>
:inoremap " ""<Left>
:inoremap ' ''<Left>

:inoremap <c-s> <Esc>
:nnoremap <c-q> <Esc>:q<CR>


"-------------------------------------------------------------------------------
" Plugin settings
" neocomplcache
" ref: http://d.hatena.ne.jp/famnet/20110619/install_neocmplcache_vim_plugin
let g:neocomplcache_enable_at_startup = 1 " setup when begins

