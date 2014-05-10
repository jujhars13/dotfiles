set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
execute pathogen#infect()
let g:vim_markdown_folding_disabled=1

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '"' . $VIMRUNTIME . '\diff"'
            let eq = '""'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype off
filetype plugin indent on

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
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set ff=unix
set fileformat=unix
set number
map <C-n> :NERDTreeToggle<CR>
map <S-A-l> :gg=G<CR>
if has('gui_running')
    set guifont=Consolas:h12:cANSI
    colorscheme xoria256
    set guioptions-=T  "remove toolbar"
endif

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
 nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)

" " Turn on case sensitive feature
 let g:EasyMotion_smartcase = 1

" " JK motions: Line motions
 map <Leader>j <Plug>(easymotion-j)
 map <Leader>k <Plug>(easymotion-k)
