" Use Vim settings, rather than Vi settings (much better!).
set nocompatible                        " original vi has nothing to do with my world
filetype off                            " no legacy filetype handling
"set relativenumber                      " turn on linenumbers
set number
set noswapfile                          " turning off swapfiles
set clipboard=unnamed

"====================================================
" Vundle 
"====================================================
" Plugin Managment
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/Vundle.vim'

"====================================================
" Plugins 
"====================================================
Plugin 'tpope/vim-rails.git'              " rails powerup
Plugin 'Lokaltog/vim-easymotion'          " Vim Jumping Motions
Plugin 'altercation/vim-colors-solarized' " Solarized Colors
Plugin 'moll/vim-node'                    " b
Plugin 'scrooloose/syntastic.git'
Plugin 'tyru/open-browser.vim.git'        " Open Links in browser
Plugin 'kien/ctrlp.vim.git'               " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'StanAngeloff/php.vim.git'         " Up-to-date PHP syntax file (5.3–5.6 support)
Plugin 'ervandew/supertab.git'            " Perform all your vim insert mode completions with Tab
Plugin 'shawncplus/phpcomplete.vim'       " Improved PHP omnicompletion
Plugin 'dsawardekar/wordpress.vim'        " Vim Plugin for WordPress Development
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'ap/vim-css-color'
Plugin 'jelera/vim-javascript-syntax'     " js syntax
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter.git'


"====================================================
" Status Line
"====================================================
Plugin 'tpope/vim-fugitive'               " git commands
Plugin 'itchyny/lightline.vim'            " A light and configurable statusline/tabline for Vim
let g:Powerline_symbols = 'fancy'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"-":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '>', 'right': '>' },
      \ 'subseparator': { 'left': '>', 'right': '>' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"====================================================
" Search Configuration
"====================================================
set ignorecase												" Case Insensitivity
set smartcase													" Unless explict match
set incsearch													" Highlight Matching as I type
set hlsearch													" Highlight Matches


"====================================================
" Mouse
"====================================================
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


"====================================================
" Colorscheme
"====================================================
syntax on
"colorscheme monakai
"colorscheme anderson
colorscheme solarized
set background=light
set t_Co=256

if $ITERM_PROFILE=="inside"
  colorscheme cobalt2
elseif $ITERM_PROFILE=="outside"
  colorscheme PaperColor 
endif

"====================================================
" Key Mappings
"====================================================
:let mapleader = ","
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>l <C-w>w
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>T :terminal<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

"====================================================
" NerdTree
"====================================================
"File Managment
Plugin 'scrooloose/nerdtree'
:let NERDTreeShowHidden=1
:let g:syntastic_javascript_checkers = ['eslint']

"====================================================
" Writing Stuff
"====================================================
Plugin 'tpope/vim-markdown'               "Syntax
Plugin 'reedes/vim-pencil'                " writing tools
Plugin 'junegunn/goyo.vim'                "focused writing
Plugin 'junegunn/limelight.vim'           "Focused writing, made better
Plugin 'reedes/vim-lexical'               "Spelling and such
Plugin 'godlygeek/tabular'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown call SetMarkdownOptions()

function SetMarkdownOptions()
  if &ft == 'markdown'
    Goyo 80
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
augroup END

"====================================================
" Other
"====================================================
set expandtab													" Set to use spaces not tabs
set title															" Set the terminal title
set autoindent												" autoindent on CR
set copyindent												" copy previous indenting
set tabstop=2													" Global Tab Width
set shiftwidth=2										" number of spaces for auto-indent
set laststatus=2											" Show the statusline all the time
set hidden														" handle multiple buffers better

filetype plugin indent on     " required

" Set autoreading to on
set autoread
au CursorHold * checktime

" allow backspacing over everything in insert mode
syntax on															" syntax on for good
set nobackup													" keep no backup file flying free
set history=50												" keep 50 lines of command line history
set ruler															" show the cursor position all the time
set showcmd														" display incomplete commands
set incsearch													" do incremental searching
set showcmd														" Show incomplete commands
set showmode													" Display the Mode
set backspace=indent,eol,start				" Nice Backspaceing

" Force Defaults to UTF-8
set encoding=utf-8
set fileencoding=utf-8

"====================================================
" Graveyard
"====================================================
" Formerly used plugins, about to get ditched, maybe, at some point
"Plugin 'tpope/vim-ragtag.git'             " tag completion goodness
"Plugin 'terryma/vim-multiple-cursors'     " allows for multiple cursor usage
"Plugin 'SirVer/ultisnips.git'             " UltiSnips - The ultimate snippet solution for Vim.
"Plugin 'bling/vim-airline'

