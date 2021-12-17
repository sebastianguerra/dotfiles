set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set relativenumber

set laststatus=2



call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " Temas para airline

" Auto parejas
Plug 'jiangmiao/auto-pairs'

" Go support
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Git support
Plug 'tpope/vim-fugitive'

" NerdTREE
Plug 'preservim/nerdtree'


call plug#end()





" Configuracion de gruvbox
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"


" Configuracion de ariline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
let g:airline#extrensions#hunls#enabled=0
let g:airline#extensions#branch#enabled=1



" GO
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command='gofmt'



"""""""""""
" Mapeos
"""""""""""""""""""
let mapleader=" "
nnoremap <A-1> :b 1<CR>
nnoremap <A-2> :b 2<CR>
nnoremap <A-3> :b 3<CR>
nnoremap <A-4> :b 4<CR>
nnoremap <A-5> :b 5<CR>
nnoremap <A-6> :b 6<CR>
nnoremap <A-7> :b 7<CR>
nnoremap <A-8> :b 8<CR>
nnoremap <A-9> :b 9<CR>


nnoremap <Leader>t :NERDTree<CR>
nnoremap <Leader>v :vs<CR>
nnoremap <A-h> <C-w>h<CR>
nnoremap <A-j> <C-w>j<CR>
nnoremap <A-k> <C-w>k<CR>
nnoremap <A-l> <C-w>l<CR>


