set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'altercation/vim-colors-solarized.git'
"Bundle 'garbas/vim-snipmate.git'
"Bundle 'groenewege/vim-less.git'
"Bundle 'honza/snipmate-snippets.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'klen/vim-taglist-plus.git'
Bundle 'mileszs/ack.vim.git'
"Bundle 'scrooloose/syntastic.git'
"Bundle 'spahl/vim-virtualenv.git'
"Bundle 'tomtom/tlib_vim.git'
"Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-markdown.git'
"Bundle 'tpope/vim-ragtag.git'
"Bundle 'tpope/vim-rails.git'
"Bundle 'tpope/vim-repeat.git'
"Bundle 'tpope/vim-surround.git'

filetype plugin indent on         " required

" -------------------
" --- Tabs/Spaces ---
" -------------------

set expandtab                     " Use spaces instead of tabs
set shiftwidth=4                  " Width of > and < commands in visual mode
set softtabstop=4                 " Backspace in insert mode removes X spaces
set tabstop=4                     " Global tab width - Affects tabs already in a file.

" ---------------------
" --- Basic Options ---
" ---------------------

syntax enable                     " Turn on syntax highlighting.
colorscheme solarized
set autoindent                    " Next line has same indentation as previous line
set background=dark
set backspace=indent,eol,start    " Intuitive backspacing.
set clipboard=unnamed             " Allow yank etc to work with the OS X clipboard
set cursorline                    " Highlights current line
set directory=/tmp/               " Set temporary directory (don't litter local dir with swp/tmp files)
set encoding=utf-8                " Use UTF-8 everywhere
set nojoinspaces                  " Remove double spaces when joining lines
if exists("&relativenumber")
  set relativenumber                " Show relative line numbers
endif
set ruler                         " Show cursor position
set scrolloff=5                   " Show 3 lines of context around the cursor
set showmode                      " Display the mode you're in
set hidden                        " Allow switching buffers without saving
set wildignore=*.pyc,*.sqlite3,*.db                          " Databases
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.ico               " Images
set wildignore+=*.eot,*.svg,*.ttf,*.woff                     " Fonts
set wildignore+=*.DS_Store                                   " OS X
set wildignore+=.git,.gitkeep                                " Version control
set wildignore+=tags,tmp/*,*.log                                   " Misc
set wildmenu                      " Enhanced command line completion
set wildmode=list:longest         " Complete files like a shell
set shell=bash\ -l                " Source ~/.profile for :sh

" ------------------
" --- Leader Key ---
" ------------------

let mapleader = ","

" --------------------
" --- Key Mappings ---
" --------------------

" Also save with captial Width
command! W :w

" Exit insert mode with Tab
imap <Tab> <esc>

" Turn off search highlighting when using substitute
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" Split a line on spaces into multiple lines
noremap <leader>s :s/ /\r <cr> :noh <cr>

" --------------------------
" --- Rails Key Mappings ---
" --------------------------

" Run current test file using Spork
:map <leader>t :!.bin/testdrb -Itest %<cr>

" Annotate models
:map <leader>a :!.bin/annotate<cr>

" -----------------
" --- Searching ---
" -----------------

set ignorecase                    " do all searches in lowercase...
set smartcase                     " ...unless there's uppercase characters
set gdefault                      " Always substitute globally on a line (To only replace the first instance, add /g at the end)
set incsearch                     " Highlight search patterns while typing
set showmatch                     " Jump to show matching brackets
set hlsearch                      " Highlight previous search pattern
nnoremap / /\v
vnoremap / /\v

" --------------------------
" --- Soft/Hard Wrapping ---
" --------------------------

"set nowrap                        " Do not wrap on window width
"set linebreak                     " Don't break words to wrap
"set textwidth=79                  " Maximum width of text
"set formatoptions=qrn1
if exists("&colorcolumn")
  set colorcolumn=80                " Set coloured column at 80 characters
endif
"command! -nargs=* Wrap set wrap linebreak nolist " Quickly turn on line wrapping
"set showbreak=>>>

" -------------------------
" --- Tabstops and EOLs ---
" -------------------------

set list
set listchars=tab:›\ ,eol:¬ " mark trailing white space

" -------------------
" --- status line ---
" -------------------

set laststatus=2                               " Always show the status line
set statusline=\ %f%m%r%h\ %w\ Line:\ %l/%L:%c " Customise the status line

" ----------------------
" --- vim-virtualenv ---
" ----------------------

" If the appropriate environment variables are set this will automatically use
" the virtualenv's python within vim thus enabling omnicomplete.
let g:virtualenv_auto_activate = 1

" ------------------------------
" --- ctrlp.vim configuration --
" ------------------------------

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = '\.bin$\|vendor\/bundle$'
nnoremap <c-b> :CtrlPBuffer<CR>

" --------------------
" --- Omnicomplete ---
" --------------------

inoremap <C-space> <C-x><C-o>
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" ---------------------------
" --- Custom indentations ---
" ---------------------------

autocmd BufRead,BufNewFile *.js,*.js.coffee,*.coffee,*.js.erb,*.html,*.rb set tabstop=2 shiftwidth=2

" ------------------------
" --- Custom FileTypes ---
" ------------------------

autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" -------------------------
" --- Ctags and Taglist ---
" --------------------------

set tags=./tags,./../tags,./*/tags               " Search for tag file
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>   " Update tags
let Tlist_WinWidth = 70                          " Window width
let Tlist_Show_One_File = 1                      " Show tags for current buffer
let Tlist_Exit_OnlyWindow = 1                    " Allow exit if only taglist
map T :TlistToggle<CR><c-w><c-w>

" --------------
" --- MacVim ---
" ---------------

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
endif

