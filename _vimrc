set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"英文菜单，适合装逼
set langmenu=en

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has('vim_starting')
	set nocompatible               " Be iMproved

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'luochen1990/rainbow'
"NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'spf13/vim-autoclose'
NeoBundle 'tpope/vim-surround'
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'lsdr/monokai' "Colorscheme
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'cespare/vim-toml'
call neobundle#end()

syntax on 
filetype plugin on
filetype indent on
" If ther are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set incsearch "Highlight as you type you search phrase
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set showmatch "Show the matching brackets
set mat=2 " How many tenths of a second to blink when matching brackets
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set relativenumber
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
set cmdheight=2

" Enable use of mouse for all modes
set mouse=a

" Keeps 5 lines visable above/below the cursor.
set scrolloff=5

" A buffer becomes hidden when it is abandoned
set hid
" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set encoding=utf8
" Use Windows as the standard file type
set ffs=dos,unix,mac
set gfn=Consolas:h11:cANSI:qDRAFT
set number
" Turn backup off, since most stuff is in SVN, git ...
set nobackup
set nowb
set noswapfile

set listchars=tab:\|\ 
exec "set listchars+=trail:\uB7,nbsp:~"
set list
set hlsearch
" Be smart when using tabs and indent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set wrap " wrap lines

set autoread
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set guioptions-=m
	set t_Co=256
	set guitablabel=%M\ %t
endif
set background=dark
colorscheme monokai

" ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.ht\*,.svn\*
else
	set wildignore+=*/.git/*,*/.svn/*
endif
" map ',' to <leader> for easy usage
let mapleader = ","
let g:mapleader = ","
" Vim tab short key mapping
" sick of typing :%s/.../.../g
nmap S :%s//g<LEFT><LEFT>
vmap S :B s//g<LEFT><LEFT>
nmap <F3> :NERDTreeToggle<CR>
nmap <F5> :make<CR>
nmap <F8> :TagbarToggle<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Visual mode pressing * or # searches for the current selection 
" Super useful! From an idea by Michael Naumann 
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR> 
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR> 

" Smart way to move between windows 
map <C-j> <C-W>j 
map <C-k> <C-W>k 
map <C-h> <C-W>h 
map <C-l> <C-W>l 

" Close the current buffer 
map <leader>bd :Bclose<cr>:tabclose<cr>gT 
 
" Close all the buffers 
map <leader>ba :bufdo bd<cr> 

nmap <C-S-tab> :bprevious<CR>
nmap <C-tab> :bnext<CR>
nmap <C-w> :bdelete<CR>
nmap <C-t> :e ~/buffer<CR>

" Remap VIM 1 to first non-blank character, and 0 to last non-blank character 
map 1 ^
map 0 $

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Misc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Remove the Windows ^M - when the encodings gets messed up 
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm 

" Quickly open a buffer for scribble 
map <leader>q :e ~/buffer<cr> 

" Quickly open a markdown buffer for scribble 
map <leader>x :e ~/buffer.md<cr> 

"----- vim-markdown -----
let g:vim_markdown_folding_disable=1
set nofoldenable

"----- unite.vim -----
" Press <SPACE> to toggle highlighting on/off, and show current value.
noremap <silent> <Space> :set hlsearch! hlsearch?<CR>
" map <leader>-f to browse for a file in the current working directory
" using (unite.vim)
nnoremap <leader>f :<C-u>Unite file<CR>
nnoremap <leader>b :<C-u>Unite buffer<CR>
" Starign insert automatically and using fuzzy file matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

"----- airline -----
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"----- rust.vim -----
"let g:rustfmt_autosave = 1

"----- rainbow -----
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"---- Tagbar.vim -----
nnoremap <leader>tt :TagbarToggle<CR>

"----- ack.vim -----
let g:ackprg = 'ack-grep -i -s -H --nocolor --smart-case --follow --nogroup --nocolumn'
" ----- Show when lines extend past column 80 -----
highlight ColorColumn ctermbg=magenta

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try 
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END
