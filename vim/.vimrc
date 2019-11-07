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
Plugin 'Yggdroot/indentLine'
"Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'matze/vim-move'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'
Plugin 'zoubin/vim-gotofile'
Plugin 'pearofducks/ansible-vim'
Plugin 'SQLUtilities'
Plugin 'Align'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'nopik/vim-nerdtree-direnter'
Plugin 'jremmen/vim-ripgrep'
Plugin 'neoclide/coc.nvim'

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

augroup fixColors
  au!
  autocmd ColorScheme *  hi! Search ctermfg=15 ctermbg=202
augroup END

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
set number relativenumber                       " Show line numbers by default
set cursorline                                  " Highlight current line
set listchars=tab:┊\                            " Indent line
set showmode                                    " Always show command or insert mode
set showmatch                                   " Show matching brackets
set formatoptions=tcrqn                         " How automatic formatting is to be done
set whichwrap=b,s,<,>,[,]                       " Allow specific keys that moves the cursor
set tabstop=2 shiftwidth=2 expandtab            " Set tabs to 4 spaces
set invlist                                     " Show hidden chars
set clipboard=unnamedplus                           " Copy to the system clipboard
set nobackup
set nowritebackup
set cmdheight=2

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
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

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

" Buffer menu
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")
nnoremap <F5> :buffers<CR>:buffer<Space>

" }}}

" === PLUGIN: NerdTree === {{{
map <F6> :NERDTreeToggle<CR>                    " Use F6 key to toggle NerdTree
autocmd VimEnter * wincmd p                     " Cursor in the opened window
let NERDTreeMouseMode=3                         " Open directories and files with 1 click
let NERDTreeWinPos="right"                      " Right position
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowHidden=1
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMapActivateNode='<right>'

autocmd FileType nerdtree nmap <buffer> <left> u
autocmd BufWinEnter * NERDTreeMirror

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
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
" }}}

" === PLUGIN: JSON === {{{
let g:indentLine_noConcealCursor = 1
let g:vim_json_syntax_conceal = 0
" }}}

" === PLUGIN: Coc === {{{
  autocmd FileType json syntax match Comment +\/\/.\+$+
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  function! LightlineGitBlame() abort
    let blame = get(b:, 'coc_git_blame', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
  endfunction

  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

    " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  " }}}
