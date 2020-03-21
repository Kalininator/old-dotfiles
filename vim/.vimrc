set nocompatible
filetype off
set encoding=utf8
let g:airline_powerline_fonts = 1

if &term =~ '256color'
    set t_ut=
endif

let mapleader = " "
set backspace=indent,eol,start
set noswapfile

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

Plug 'christoomey/vim-tmux-navigator'

Plug 'kalininator/md-img-paste.vim'
Plug 'kalininator/connectorcli.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json'

Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'jparise/vim-graphql'


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips"
let g:UltiSnipsEditSplit="vertical"

let g:ale_fixers = {'javascript': [ 'eslint'], 'json': 'eslint', 'terraform': 'terraform', 'typescript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
nmap <leader>d <Plug>(ale_fix)


" FZF files
nmap <Leader>F :GFiles<CR>
nmap <Leader>f :Files<CR>
" FZF Lines
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap ; :Buffers<CR>
nmap <Leader>a :Ag<CR>
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gr <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
nmap <silent> <leader>r :call connectorcli#run()<CR>
nmap <silent> <leader>R :call connectorcli#runRealServer()<CR>

" If no file specified, auto open nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
"Ctrl n toggles nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=['node_modules']

set number
set relativenumber

set smarttab
set tabstop=4
set shiftwidth=4


let root = systemlist('git rev-parse --show-toplevel')[0]

command! -nargs=* Rag
  \ call fzf#vim#ag(<q-args>, extend(g:rc#git#Groot(), g:fzf_layout))

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

inoremap kj <Esc>

"show tabs
set list
set listchars=tab:\|\ 

syntax on
set cursorline
" set colorcolumn=81

set foldmethod=syntax
set nofoldenable

"Search stuff
set ignorecase
set smartcase
set noshowmode
set noshowcmd
set shortmess+=F

" set background dark
colorscheme molokai


