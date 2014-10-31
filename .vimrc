" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible

"source $VIMRUNTIME/vimrc_example.vim
execute pathogen#infect()
let g:vim_markdown_folding_disabled=1

filetype off
filetype plugin indent on

"neocomplete
let g:neocomplete#enable_at_startup = 1

"turn off backups
set nobackup
set nowritebackup

set history=50    " keep 50 lines of previous commands
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set scrolloff=3
set showmode	   " show current editing mode
set showcmd
set hidden

" visual and audio errors
set visualbell
set errorbells 

set cursorline	  " highlight current line
set ttyfast
set incsearch     " do incremental searching

" case only matters with mixed case expressions
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"no dos line endings here
set ff=unix
set fileformat=unix

" Numbers
set number
set numberwidth=5

set ruler         "show the cursor position all the time
set laststatus=2
set undofile

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text
  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif
  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC
  augroup END
else
  set autoindent " always set autoindenting on
endif " has("autocmd")

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

if has('gui_running')
    set guioptions-=T  "remove toolbar"
endif

" Map ctrl-movement keys to window switching
map <C-Up> <C-w><Up>
map <C-Down> <C-w><Down>
map <C-Right> <C-w><Right>
map <C-Left> <C-w><Left>

"=======nerdtree========
"autocmd vimenter * NERDTree "autoload nerdree on startup
map <C-n> :NERDTreeToggle<CR>
"close vim if all that's left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open nedtree if no files have been specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" Open URL
command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

" unmap f1 as it's in a terrible position on lenovo laptops and I keep hitting it by accident
map <F1> <Esc>
imap <F1> <Esc>

"colorscheme xoria256
colorscheme monokai
