set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

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

let mapleader = "\<Space>"
set number
set list
set listchars=tab:>-
set ru
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=eol,start
syntax enable
set splitbelow
set splitright
set expandtab
set softtabstop=4
set shiftwidth=4
set breakindent
set breakindentopt=shift:2
let &showbreak='⤷ '
set noswapfile
set undofile
set undodir=~/.vim/undodir
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean

nnoremap k gk
nnoremap j gj

nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-h> <C-w><Left>
nnoremap <C-l> <C-w><Right>

map <Tab>h gT
map <Tab>l gt

nnoremap <Leader>w :update<CR>

autocmd VimResized * execute "normal! \<C-w>="

" CommandT config
let g:CommandTTraverseSCM = 'pwd'
let g:CommandTWildIgnore=&wildignore . ",**/node_modules/**"

" YouCompleteMe Typescript config
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
nnoremap <Leader>yd ::YcmCompleter GoToDefinition<CR>
nnoremap <Leader>yr ::YcmCompleter GoToReferences<CR>
nnoremap <Leader>yt ::YcmCompleter GetType<CR>

" NERD Tree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent> <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd! bufwritepost .vimrc source % "auto source this file
