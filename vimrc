set nocompatible
filetype off
set shell=/bin/bash

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'romainl/flattened'
Plug 'benmills/vimux'
Plug 'bkad/CamelCaseMotion'
Plug 'cespare/vim-toml'
Plug 'chase/vim-ansible-yaml'
Plug 'derekwyatt/vim-scala'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'embear/vim-localvimrc'
Plug 'evidens/vim-twig'
Plug 'fatih/vim-go'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hashivim/vim-terraform'
Plug 'honza/dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'ianks/vim-tsx'
Plug 'ingydotnet/yaml-vim'
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'jnwhiteh/vim-golang'
Plug 'jparise/vim-graphql'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-mix-format'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ngmy/vim-rubocop'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'Quramy/tsuquyomi'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'skalnik/vim-vroom'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/bats.vim'
Plug 'vimwiki/vimwiki'
Plug 'wincent/Command-T'
call plug#end()

filetype plugin indent on

nmap OA gk
nmap OB gj

"set termguicolors " 24-bit colors
" needed for 24-bit colors running tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=light
set t_Co=256
colorscheme solarized

autocmd BufNewFile,BufRead *.json set ft=javascript

syntax on
let g:tex_flavor='latex'
set ofu=syntaxcomplete#Complete

au BufRead,BufNewFile *.less set filetype=less
autocmd BufWritePost,FileWritePost *.less silent !lessc <afile> <afile>:r.css
let coffee_compile_on_save = 1

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set colorcolumn=80
highlight ColorColumn ctermbg=4
set encoding=utf-8
set scrolloff=6
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list,longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile

let mapleader = ","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=80
set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>v V']
nnoremap <leader>n :NERDTree<CR>
inoremap jj <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""
" coc
"""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Give more space for displaying messages.
set cmdheight=2

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"""""""""
" end coc
"""""""""

"ctags
"open location with tag as tab
map <C-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"open location with tag as split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./.tags;

"Fugitive config
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

set modelines=5

" show excess whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" vim-go configuration
let g:go_bin_path = expand("~/bin")
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gbd :GoDocBrowser<CR>
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>dd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let go_metalinter_command = "golangci-lint run"

let g:vimwiki_list = [{'path': '~/.vimwiki/wiki', 'path_html': '~/.vimwiki/html'}]

let g:camelcasemotion_key = '<leader>'

" Golang
set rtp+=$GOROOT/misc/vim

" vroom configuration
let g:vroom_use_vimux = 1
let g:vroom_test_unit_command = 'm'
let g:go_rename_command = 'gopls'
map <Leader>sf :VroomRunTestFile<CR>
map <Leader>sn :VroomRunNearestTest<CR>
map <Leader>sl :VroomRunLastTest<CR>
" map <Leader>sa :call RunAllSpecs()<CR>

" Rust
let g:rustfmt_autosave = 1
"if executable('rls')
  "au User lsp_setup call lsp#register_server({
        "\ 'name': 'rls',
        "\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        "\ 'whitelist': ['rust'],
        "\ })
"endif

let g:localvimrc_persistent=1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendor|_site)$',
  \ }

hi clear SpellBad
hi SpellBad cterm=bold,italic ctermfg=red

set completeopt+=longest

autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
