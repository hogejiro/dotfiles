"-------------------------------------------------------------------------------
" Basic settings
set nocompatible        " OFF the compatibility mode (vi)

" NeoBundle settings

filetype off
set rtp+=~/dotfiles/.vim/bundle/neobundle.vim/
call neobundle#rc()

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'othree/html5'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/TwitVim'
NeoBundle 'vimtaku/hl_matchit.vim.git'
NeoBundle 'Align'   
NeoBundle 'JavaScript-syntax'
NeoBundle 'sudo.vim'

filetype plugin on

set number              " display line number
set title               " set title at titlebar
set encoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932,sjis
set shortmess+=I        " file message format
set visualbell          " flash not beep
set showmode            " display current mode
set ambiwidth=double

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
set foldmethod=marker           " fold {{{}}}

if has('multi_byte_ime') || has('xim')
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
set softtabstop=4

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
inoremap <TAB> <c-r>=InsertTabWrapper()<cr>

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
:inoremap ` ``<Left>

:inoremap <c-s> <Esc>
:nnoremap <c-q> <Esc>:q<CR>

nnoremap euc :set encoding=euc-jp<CR> :set fileencoding=euc-jp<CR>
nnoremap utf :set encoding=utf-8<CR>  :set fileencoding=utf-8<CR>

" for US keyboard
:nnoremap ; :
:nnoremap : ;

" buffer view
nnoremap <C-P> :Unite buffer<CR>
" file view
nnoremap <C-N> :UniteWithBufferDir file -buffer-name=files<CR>
" recent files view
nnoremap <C-Z> :Unite file_mru<CR>
" outline
nnoremap <C-Y> :Unite outline<CR>
" colorscheme
nnoremap sc :<C-u>Unite colorscheme -auto-preview<CR>

function! YanktmpYank() range
  let filepath = expand("%")
  let g:yanktmp_file = $HOME . "/tmp/" . strftime("%Y%m%d%H%M%S") . fnamemodify(filepath, ":t")
  call writefile(getline(a:firstline, a:lastline), g:yanktmp_file)
endfunction

map my :call YanktmpYank()<CR>

"-------------------------------------------------------------------------------
" Plugin settings
set rtp+=~/dotfiles/.vim

" neocomplcache
" ref: http://d.hatena.ne.jp/famnet/20110619/install_neocmplcache_vim_plugin
let g:neocomplcache_enable_at_startup = 1 " setup when begins
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list          = 20
let g:neocomplcache_snippets_dir      = '~/dotfiles/.vim/snippets'
" ref: http://code-life.net/?p=2308
imap <expr><C-k> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-o>D"

" unite
let g:unite_enable_start_insert     = 0
let g:unite_enable_split_vertically = 1

" vim-ref
let g:ref_phpmanual_path = $HOME . "/dotfiles/.vim/document/php-chunked-xhtml"
nnoremap rp :<C-u>Ref phpmanual<CR>
nnoremap rh :<C-u>Ref hoogle<CR>

" neco-ghc
let $PATH = $PATH . ':' . expand("~/.cabal/bin")

" PDV (PhpDocumenter for vim)
inoremap <C-@> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-@> :call PhpDocSingle()<CR>
vnoremap <C-@> :call PhpDocRange()<CR>

" GNU GLOBAL
nnoremap <C-g> :Gtags
nnoremap <C-h> :Gtags -f %<CR>
nnoremap <C-i> :GtagsCursor<CR>
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" TwitVim
let g:twitvim_count = 200

" vimfiler
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
nnoremap filer :VimFiler -buffer-name=explorer -split -winwidth=35 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)

" matchiit
runtime macros/matchit.vim
let b:match_words = "if:endif,foreach:endforeach,\<begin\>:\<end\>,\<div.*\>:\</div\>"
let b:match_ignorecase = 1

" for hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft_regexp = 'html\|vim\|ruby\|sh'
