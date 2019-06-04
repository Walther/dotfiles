" Vim UI settings
set laststatus=2
set nu
set mouse=a
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set switchbuf=usetab,newtab

" Coding style
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

" Syntax highlighting stuff
set termguicolors
syntax on
colorscheme monokai

" Keybindings
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>
inoremap <S-tab> <C-d>
inoremap <C-c> <ESC>
map <C-PageUp> :bprev<CR>
map <C-PageDown> :bnext<CR>

" Commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

:command Untrail %s/\s\+$/g

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
call plug#end()

" Plugin settings
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1

let g:promptline_theme = 'airline'
let g:promptline_preset = {
    \'a' : [ '$(hostname)' ],
    \'b' : [ promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd(), promptline#slices#vcs_branch() ]}

