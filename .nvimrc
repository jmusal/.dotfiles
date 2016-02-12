" Use Vim settings, rather than Vi settings (much better!).

set nocompatible                        " original vi has nothing to do with my world
filetype off                            " no legacy filetype handling
set relativenumber                              " turn on linenumbers
set number
set noswapfile                          " turning off swapfiles

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/Vundle.vim'

" Plugins

Plugin 'scrooloose/nerdtree'              " file management
Plugin 'tpope/vim-rails.git'              " rails powerup
Plugin 'Lokaltog/vim-easymotion'          " Vim Jumping Motions
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized' " Solarized Colors
Plugin 'rking/ag.vim'                     " Adding Silver Searcher - note this must also be installed on the system
Plugin 'jelera/vim-javascript-syntax'     " js syntax
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
Plugin 'mxw/vim-jsx'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
" Formerly used plugins, about to get ditched, maybe, at some point
"Plugin 'tpope/vim-fugitive'               " git commands
"Plugin 'tpope/vim-ragtag.git'             " tag completion goodness
"Plugin 'terryma/vim-multiple-cursors'     " allows for multiple cursor usage
"Plugin 'SirVer/ultisnips.git'             " UltiSnips - The ultimate snippet solution for Vim.
"Plugin 'bling/vim-airline'
"Plugin 'itchyny/lightline.vim'            " A light and configurable statusline/tabline for Vim


" Search Configuration

set ignorecase		" Case Insensitivity
set smartcase		" Unless explict match

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

" Search Configuration

set ignorecase												" Case Insensitivity
set smartcase													" Unless explict match
set incsearch													" Highlight Matching as I type
set hlsearch													" Highlight Matches

" Other

set expandtab													" Set to use spaces not tabs
set title															" Set the terminal title
set autoindent												" autoindent on CR
set copyindent												" copy previous indenting
set tabstop=2													" Global Tab Width
set shiftwidth=2										" number of spaces for auto-indent
set laststatus=2											" Show the statusline all the time
set hidden														" handle multiple buffers better

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set t_Co=256

" Colorscheme
syntax on
colorscheme cobalt2

:let mapleader = ","
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>l <C-w>w
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>T :terminal<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

:let NERDTreeShowHidden=1
:let g:syntastic_javascript_checkers = ['eslint']




" Writing Stuff

Plugin 'tpope/vim-markdown'               "Syntax
Plugin 'reedes/vim-pencil'                " writing tools
Plugin 'junegunn/goyo.vim'                "focused writing
Plugin 'junegunn/limelight.vim'           "Focused writing, made better
Plugin 'reedes/vim-lexical'               "Spelling and such
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

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
augroup END
