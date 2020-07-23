set nocompatible
filetype off
set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'altercation/vim-colors-solarized'
Plugin 'bkad/CamelCaseMotion'
Plugin 'lifepillar/vim-solarized8'
Plugin 'benmills/vimux'
Plugin 'cespare/vim-toml'
Plugin 'chase/vim-ansible-yaml'
Plugin 'derekwyatt/vim-scala'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'embear/vim-localvimrc'
Plugin 'evidens/vim-twig'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/dockerfile.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'ianks/vim-tsx'
Plugin 'ingydotnet/yaml-vim'
Plugin 'janko-m/vim-test'
Plugin 'jgdavey/tslime.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'jparise/vim-graphql'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-mix-format'
Plugin 'ngmy/vim-rubocop'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'Quramy/tsuquyomi'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/bats.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'wincent/Command-T'
call vundle#end()
filetype plugin indent on

nmap OA gk
nmap OB gj

set termguicolors " 24-bit colors
" needed for 24-bit colors running tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme solarized8
set background=light

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
