nmap OA gk
nmap OB gj

set background=dark
colorscheme molokai

autocmd BufNewFile,BufRead *.json set ft=javascript

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
syntax on
let g:tex_flavor='latex'
	set grepprg=grep\ -nH\ $*
set ofu=syntaxcomplete#Complete

au BufRead,BufNewFile *.less set filetype=less
autocmd BufWritePost,FileWritePost *.less silent !lessc <afile> <afile>:r.css
let coffee_compile_on_save = 1

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set colorcolumn=120
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
nnoremap <leader>w <C-w>v<C-w>1
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set t_Co=256

let g:vimwiki_list = [{'path': '~/.vimwiki/wiki', 'path_html': '~/.vimwiki/html'}]

"ctags
"open location with tag as tab
map <C-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"open location with tag as split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Fugitive config
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" Golang
set rtp+=$GOROOT/misc/vim

map ,t :w<cr>
map ,- :nohl<cr>

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
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

set modelines=5
