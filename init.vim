"set fileencodings=utf-8,utf-16,gb2312,gbk,gb18030,latin1,ucs-bom

set nocompatible
filetype off

call plug#begin(stdpath('data').'/plugged')

Plug 'vim-airline/vim-airline'

Plug 'Yggdroot/indentLine'

Plug 'jiangmiao/auto-pairs'

Plug 'joshdick/onedark.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'preservim/nerdcommenter'

call plug#end()

filetype plugin indent on

syntax on

colorscheme onedark

set number numberwidth=5
set mouse=a
set cmdheight=1
set laststatus=2

set showcmd
autocmd BufEnter * silent! lcd %:p:h

set incsearch hlsearch
set showmatch matchpairs+=<:>

set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab
set autoindent

set fileformat=unix
set fenc=utf-8

set t_Co=256

let g:indentLine_char='|'
let g:indentLine_enabled=1

let g:python3_host_prog="/home/fangk/anaconda3/envs/pytorch10/bin/python3"

let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-vimlsp']

set hidden
set updatetime=100
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <c-p> :CocCommand python.setInterpreter<CR>
