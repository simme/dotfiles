" Configure vundle
set nocompatible
filetype off
set shell=/bin/bash	" Breaks with fish...
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" ----------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------

Bundle 'gmarik/vundle'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'simme/vim-base16-colors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Show git status in line-number gutter.
Bundle 'airblade/vim-gitgutter'
" silver searcher plugin, instead of grep.
Bundle 'rking/ag.vim'
" Plugin for aligning stuff.
Bundle 'tsaleh/vim-align'
" Nerdtree!
Bundle 'scrooloose/nerdtree'
" Surround selected text with punctuation:
Bundle 'tpope/vim-surround'
" Smart input of ([ etc.
Bundle 'kana/vim-smartinput'
" Ctrl-p
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mhinz/vim-signify'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Bundle 'keith/swift.vim'
Bundle 'w0rp/ale'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'PProvost/vim-markdown-jekyll'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/Colorizer'
Plugin 'othree/html5.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------
" Theme
" ----------------------------------------------------------------------

set number
syntax enable
colorscheme simme
let g:airline_theme='base16_eighties'
highlight clear LineNr

" General configuration
set number                          " Enable line numbers
set backspace=indent,eol,start      " Allow backspace in insert mode
set history=1000                    " Lots of history
set showcmd                         " Show commands as they are written
set showmode                        " Show current mode
set gcr=a:blinkon0                  " Disable blinking cursor
set visualbell                      " No sounds
set autoread                        " Reload files changed outside of Vim
set modelines=0                     " Turn off modelines
set encoding=utf-8                  " UTF8 all the things
set ttyfast                         " Set fast TTY
set laststatus=2                    " Always show status line
set ch=2                            " Command line height 2
set formatoptions=qrn1              " Autoformat options
set colorcolumn=120                 " Show 120 column mark
set hidden                          " Enable background buffers
set noshowmode                      " Hide mode, shown in Powerline

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
set undodir=~/.vim/backups
set undofile

" Indentation settings
set autoindent                      " Automatic indentation
set smartindent
set smarttab
set shiftwidth=4                    " 4 spaces
set softtabstop=4
set tabstop=4
set expandtab                       " Spaces for tabs

" Display end of lines and no breaking spaces
set list
set listchars=tab:··,eol:¬,nbsp:†

" Fold settings
set foldmethod=indent               " Fold based on indent
set nofoldenable                    " Don't fold by default

" Completion
set wildmode=list:longest
set wildmenu                        " Enable autocomplete menu
set wildignore=*.o,*.obj,*-         " Don't complete from these files
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg*,*.gif

" Scrolling
set scrolloff=8                     " 8 lines of scroll margin
set sidescrolloff=15                " 15 lines of horizontal margin
set sidescroll=1

" Searching
set ignorecase                      " Ignore case by default
set smartcase                       " Smart case sensitivity
set gdefault                        " Global search by default
set incsearch                       " Jump to matches while searching
set showmatch                       " Show matching braces etc
set hlsearch                        " Highlight matches

" Signfiy options
let g:signify_vcs_list = [ 'git' ]

" Syntastic options
let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm'] 

" CtrlP options
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site'

" -------------------------------------------------------------------------
" Aliases
" -------------------------------------------------------------------------

" Use , as leader
let mapleader=","

" Open NERDTree
map <leader>n :NERDTreeToggle<CR>

" Clear highlighting
nnoremap <leader><space> :noh<CR>

" Trim trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Ignore arrow keys, we are hard core
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Fix escape missess...
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fix j and k to work as expected with wrapping lines
nnoremap j gj
nnoremap k gk

" Airline Configuration
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Buffer Navigation
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
