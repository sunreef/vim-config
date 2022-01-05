set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

"Plug 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'tell-k/vim-autopep8'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'kh3phr3n/python-syntax'
Plug 'racer-rust/vim-racer'
Plug 'tmux-plugins/vim-tmux'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-eunuch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'yegappan/taglist'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'
Plug 'preservim/nerdtree'
Plug 'derekwyatt/vim-fswitch'
Plug 'qpkorr/vim-bufkill'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'pseewald/anyfold'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"Jedi-vim settings
let g:jedi#use_splits_not_buffers = "right"
autocmd FileType python setlocal completeopt-=preview

"ALE settings
"let g:ale_linters = {'rust': ['rls']}

" C++ options
let g:clang_format#auto_format = 1

" Rust options
let g:rustfmt_autosave = 1
let g:racer_cmd = "~/.cargo/bin/racer"
let g:rustc_path = "~/.cargo/bin/rustc"
"let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Python options
let g:autopep8_max_line_length = 100
let g:autopep8_disable_show_diff = 1

" <TAB> Settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" UI config
syntax on
colorscheme custom-colorsbox
set number
set lazyredraw
set showmatch
set laststatus=2


" ScrollColor shortcuts
nnoremap OD :PREVCOLOR<cr>
nnoremap OC :NEXTCOLOR<cr>

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
autocmd FileType * AnyFoldActivate

" Movement remapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Utility remap
let mapleader=","
nnoremap <leader>u :GundoToggle<cr>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
inoremap jk <Esc>

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

" Window splits navigation
nnoremap [1;5C <C-w>l
nnoremap [1;5D <C-w>h
nnoremap [1;5A <C-w>k
nnoremap [1;5B <C-w>j

nnoremap <C-t> :BuffergatorMruCycleNext<cr>
nnoremap <C-y> :BuffergatorMruCyclePrev<cr>
nnoremap <C-h> :bprevious<cr>
nnoremap <C-l> :bnext<cr>

" End and beginning of line mapping
nnoremap B ^
nnoremap W $
vnoremap B ^
vnoremap W $

" Taglist command
nnoremap <leader>t :TlistToggle<cr>

" Miscellenaous options
set timeoutlen=1000 ttimeoutlen=0

augroup python
        autocmd!
        autocmd FileType python
                                \   syn keyword pythonBuiltin self
                                "\ | highlight def link pythonBuiltin Special
augroup end

" CtrlP settings
"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|target)$',
  \ 'file': '\v\.(log|pdf|aux|blg|bbl|bcf|lbl|exe|so|dll|class|png|jpg|jpeg)$',
\}
nnoremap <Leader>ss :CtrlPObsession<CR>

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_current_file = 1

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Buffergator settings
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" FSwitch shortcut
nnoremap <leader>fs :FSHere<cr>

" NerdTree settings
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20
