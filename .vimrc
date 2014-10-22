set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
execute pathogen#infect()
let g:vim_markdown_folding_disabled=1

syntax on
filetype off
filetype plugin indent on

"neocomplete
let g:neocomplete#enable_at_startup = 1

"=======nerdtree========
"autocmd vimenter * NERDTree "autoload nerdree on startup
map <C-n> :NERDTreeToggle<CR>
"close vim if all that's left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open nedtree if no files have been specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast

set ff=unix
set fileformat=unix
set number
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

if has('gui_running')
    set guioptions-=T  "remove toolbar"
endif

" Map ctrl-movement keys to window switching
map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Right> <C-w><Right>
map <C-Left> <C-w><Left>
"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" " unmap f1 as it's in a pants position on lenovos and I keep hitting it
map <F1> <Esc>
imap <F1> <Esc>

"colorscheme xoria256
colorscheme monokai
