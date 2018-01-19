" === Folding Structure ==== {{{
set foldmethod=marker                           " Fold based on indent
set foldnestmax=10                              " Deepest fold is 10 levels
" }}}

" === Vundle && Plugins === {{{
set nocompatible                                " be iMproved, required
filetype off                                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe' " Do `./install.py --clang-completer --system-libclang` after installation
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'matze/vim-move'
Plugin 'mileszs/ack.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zoubin/vim-gotofile'
Plugin 'pearofducks/ansible-vim'
Plugin 'SQLUtilities'
Plugin 'Align'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" }}}

" === Theme and colors === {{{
set t_Co=256                                    " Emulate 256 colors
set background=dark                             " Changing background color
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1                             " Enable molokai colors in terminal
" }}}

" === General Configuration === {{{
syntax on                                       " Turn on syntax highlighting
set autoread                                    " Reload files changed outside vim
set hidden                                      " Easier buffer switching
set title                                       " Set automatic title terminal window
set lazyredraw                                  " Do not redraw while running macros (much faster)
let mapleader=','                               " Set the leader key to comma
highlight Normal guibg=black guifg=white        " Hightlight a text in a diferent color
set hlsearch                                    " Highlight searches
set textwidth=0                                 " Linewidth to endless
"set paste                                      " Paste text from other window without unexpected effects (disable in order to delimitMate plugin to work)
set linebreak                                   " Wrap lines at convenient points
set nuw=5                                       " Increase column number width
set ruler                                       " Show line and column information
set laststatus=2                                " Display status line
set incsearch                                   " Do highlight as you type you search phrase
set ignorecase                                  " Case insensitive searches
set smartcase                                   " Case sensitive searches for capital letters
set backspace=indent,eol,start                  " Repair wired terminal/vim settings
set autoindent                                  " Set auto indentation
set smartindent                                 " Set smart indentation
set smarttab                                    " Set smart tab on indentation
set copyindent                                  " Copy the previous indentation
set shiftround                                  " Multiple shiftwidth when indenting with '<' and '>'
set nostartofline                               " Stop certain movements from always going to the first character of a line
set encoding=utf-8                              " Necessary to show Unicode glyphs
set ttyfast                                     " Send more characters for redraws
set ttymouse=sgr                                " Set terminal name that supports mouse codes(sgr, xterm, xterm2, netterm, dec, jsbterm, pterm).
set mouse=a                                     " Enable mouse use in all modes
set number                                      " Show line numbers by default
set cursorline                                  " Highlight current line
set listchars=tab:┊\                            " Indent line
set showmode                                    " Always show command or insert mode
set showmatch                                   " Show matching brackets
set formatoptions=tcrqn                         " How automatic formatting is to be done
set whichwrap=b,s,<,>,[,]                       " Allow specific keys that moves the cursor
set tabstop=2 shiftwidth=2 expandtab            " Set tabs to 4 spaces
set invlist                                     " Show hidden chars
set clipboard=unnamedplus                       " Copy to the system clipboard

" Remove window scrollbars in gvim and macvim
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" Auto reload on save
autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
" }}}

" === History === {{{
set history=1000                                " Remember more commands and search history
set undolevels=1000                             " Use many much levels of undo
" }}}

" === Completion and swap files === {{{
set wildmenu
set noswapfile
set nobackup
set nowb
set wildignore=*.swp,*.bak,*.swo,*.pyc,*.class,*DS_Store*
" }}}

" === Remaps === {{{
au VimEnter * nnoremap <silent> <F8> :TlistToggle<cr>
map <C-l> <ESC>:bn<CR>
map <C-h> <ESC>:bp<CR>

" Tab navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Clipboard
noremap <c-s> <Esc>:Update<CR>
vnoremap <c-s> <Esc>:Update<CR>
inoremap <c-s> <Esc>:Update<CR>
nnoremap <C-c> "+y
vnoremap <C-c> "+y

" Trailing white spaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" === PLUGIN: NerdTree === {{{
map <F6> :NERDTreeToggle<CR>                    " Use F6 key to toggle NerdTree
autocmd VimEnter * wincmd p                     " Cursor in the opened window
let NERDTreeMouseMode=3                         " Open directories and files with 1 click
let NERDTreeWinPos="right"                      " Right position
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowHidden=1
let NERDTreeMapActivateNode='<right>'
autocmd FileType nerdtree nmap <buffer> <left> u

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Change default directory and arrow colours
hi NERDTreeDir guifg=#465457 ctermfg=38
hi NERDTreeOpenable cterm=NONE ctermbg=NONE ctermfg=197 guifg=#EC0151 guibg=NONE
hi NERDTreeClosable cterm=NONE ctermbg=NONE ctermfg=197 guifg=#EC0151 guibg=NONE
" }}}

" === PLUGIN: NerdTreeTabs === {{{
let g:nerdtree_tabs_open_on_gui_startup = 2
let g:nerdtree_tabs_open_on_console_startup = 2
" }}}

" === PLUGIN: vim-airline === {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='behelit'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}

" === PLUGIN: Move === {{{
let g:move_key_modifier = 'C'
" }}}

" === PLUGIN: Indentlines === {{{
let g:indentLine_color_gui = '#A4E57E'          " Indent line color
let g:indentLine_char = '·'                     " Indent line character
" }}}

" === PLUGIN:  ctrlp === {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'             " Only the current directory and subdirectories // ra?
let g:ctrlp_custom_ignore = '\v[\/](.git|node_modules|bower|build)'
let g:ctrlp_show_hidden = 1                     " Search hidden files
" }}}


" === PLUGIN: JSON === {{{
let g:indentLine_noConcealCursor = 1
let g:vim_json_syntax_conceal = 0
" }}}

" === PLUGIN: CtrlP === {{{
let g:ctrlp_show_hidden=1
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
" }}}

