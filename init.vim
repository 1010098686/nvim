set nocompatible
filetype off

call plug#begin('$HOME/.local/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'Yggdroot/indentLine'

Plug 'jiangmiao/auto-pairs'

Plug 'joshdick/onedark.vim'

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdcommenter'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'numToStr/FTerm.nvim'

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

call plug#end()

filetype plugin indent on

syntax on

colorscheme gruvbox

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

let g:python3_host_prog="/usr/bin/python"

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
"nnoremap <c-e> :CocCommand explorer<CR>
nnoremap <c-e> :NvimTreeToggle<CR>

nnoremap <c-n> <Cmd>BufferNext<CR>
nnoremap <c-b> <Cmd>BufferPrevious<CR>
nnoremap <c-m> <Cmd>BufferClose<CR>
nnoremap <leader>bp <Cmd>BufferPick<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

lua << EOF
require('FTerm').setup({
    cmd='powershell'
})

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
EOF

nnoremap <leader>i :lua require('FTerm').toggle()<CR>
