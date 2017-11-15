set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'kh3phr3n/python-syntax'
Plugin 'racer-rust/vim-racer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs=0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_rust_checkers = ['rustc']

" Rust options
let g:rustfmt_autosave = 1

" Python options
let g:autopep8_max_line_length=100
let g:autopep8_disable_show_diff=1

" <TAB> Settings
set tabstop=4
set softtabstop=4
set expandtab

" UI config
syntax on
colorscheme distinguished
set number
set cursorline
set lazyredraw
set showmatch
set laststatus=0

" ScrollColor shortcuts
nnoremap [D :PREVCOLOR<cr>
nnoremap [C :NEXTCOLOR<cr>

" Search options
set incsearch
set hlsearch

" Folding options
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
autocmd FileType c++ set foldmethod=syntax
autocmd FileType rust set foldmethod=syntax
autocmd FileType python set foldmethod=indent

" Movement remapping
nnoremap j gj
nnoremap k gk

"Utility remap
let mapleader=","
nnoremap <leader>u :GundoToggle<cr>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
inoremap jk <Esc>
inoremap jj <Esc>
nnoremap <C-_> ^i#<Esc>

" Allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" File tabs handling
set tabpagemax=100
if exists('$TMUX')
    nnoremap  :tabr<cr>
    nnoremap  :tabl<cr>
    nnoremap  :tabp<cr>
    nnoremap  :tabn<cr>
else
    nnoremap <C-k> :tabr<cr>
    nnoremap <C-j> :tabl<cr>
    nnoremap  :tabp<cr>
    nnoremap  :tabn<cr>
endif

" Miscellenaous options
set timeoutlen=1000 ttimeoutlen=0
