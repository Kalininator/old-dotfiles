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

" Plug 'vimpostor/vim-tpipeline'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'

Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'

Plug 'kalininator/md-img-paste.vim'
Plug 'kalininator/connectorcli.vim'


Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}

Plug 'sheerun/vim-polyglot'
Plug 'jxnblk/vim-mdx-js'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescriptreact': ['eslint'],
  \    'typescript': ['eslint'],
  \    'json': ['eslint'],
  \    'terraform': ['terraform'],
  \    'go': ['gofmt'],
  \    'rust': ['rustfmt']
\}
let g:ale_rust_rls_config = {
  \   'rust': {
  \     'clippy_preference': 'on'
  \   }
  \}
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

let g:coc_global_extensions = ['coc-ultisnips', 'coc-go', 'coc-tsserver', 'coc-json', 'coc-snippets', 'coc-css', 'coc-markdownlint', 'coc-styled-components', 'coc-rls', 'coc-rust-analyzer']

" " Run jest for current project
" command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" " Run jest for current file
" command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" " Run jest for current test
" nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" " Init jest in current cwd, require global jest command exists
" command! JestInit :call CocAction('runCommand', 'jest.init')

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gr <Plug>(coc-rename)
nmap <silent> <Leader>gu <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif



autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
nmap <silent> <leader>r :call connectorcli#run()<CR>
nmap <silent> <leader>R :call connectorcli#runRealServer()<CR>

" If no file specified, auto open nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
"Ctrl n toggles nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
" enable line numbers
" let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
" autocmd FileType nerdtree setlocal relativenumber
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['node_modules']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

set number
set relativenumber

set smarttab
set tabstop=2
set shiftwidth=2


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
" set list
" set listchars=tab:\|\ 

syntax on
set cursorline

set foldmethod=syntax
set nofoldenable

"Search stuff
set ignorecase
set smartcase
set noshowmode
set noshowcmd
set shortmess+=F

" colorscheme molokai
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
