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
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
endif
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

if has('nvim')
	lua << EOF
	local nvim_lsp = require('lspconfig')

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		-- Enable completion triggered by <c-x><c-o>
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local opts = { noremap=true, silent=true }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
		buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
		buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
		buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
		buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

	end

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local servers = { 'rust_analyzer' }
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup {
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			}
		}
	end
EOF
endif
