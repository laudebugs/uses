set nocompatible

set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set number
"set colorcolumn=80"
set tw=79
set fo-=t   " don't automatically wrap text when typing
set noswapfile
set nobackup
"highlight ColorColumn ctermbg=7"
colorscheme slate

filetype plugin indent on
syntax on

" let vimclojure#HighlightBuiltins = 1
" let vimclojure#ParenRainbow = 10

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap tj  :tabnext<CR>
if bufwinnr(1)
  map - <C-W><C-W>
  map + <S-C-W><S-C-W>
endif

"---------------- matching delimiters ------------------"
" inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
" inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
" inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
" inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i
"jump out of parenthesis

" inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
  if exists("b:robstack")
    let b:robstack = b:robstack . a:schar
  else
    let b:robstack = a:schar
  endif
endfunction

function! BC_GetChar()
  let l:char = b:robstack[strlen(b:robstack)-1]
  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
  return l:char
endfunction
"--------------------- end ----------------------------"

"Configs for specific filetypes"
au Filetype python setlocal tabstop=4 shiftwidth=4
au Filetype javascript setlocal tabstop=2 shiftwidth=2
au Filetype c setlocal tabstop=4 shiftwidth=4
au Filetype java setlocal tabstop=4 shiftwidth=4
au Filetype rust setlocal tabstop=4 shiftwidth=4


"----------------- plugin stuff ----------------------"

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ajh17/VimCompletesMe'
Plugin 'rust-lang/rust.vim'
Plugin 'prettier/vim-prettier'


"syntax plugins"
Plugin 'sheerun/vim-polyglot'
"eslint checker"
Plugin 'vim-syntastic/syntastic'

" Plugin 'dense-analysis/ale'"

call vundle#end()            " required
filetype plugin indent on    " required

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:airline_theme='angr'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules