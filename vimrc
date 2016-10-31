"-- Walther's Vim Configuration --
"--  Unlicenced for Great Good  --

"-- Vundle stuff
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" my favourite plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required

"-- End Vundle stuff --

"-- General options --

set encoding=utf-8              " For obvious reasons
set number                      " Show line numbers
set laststatus=2                " Always show statusline
set ruler                       " Show the line and column number of the cursor position
let molokai_original = 1        " a nice variable for the theme...
colorscheme molokai             " set the color scheme to molokai...
syntax on                       " and set it to use, yay colors <3
set mouse=a                     " mouse scrolling, CLI can be modern!
set switchbuf=usetab,newtab     " switch to existing buffers instead of forcing a new one in current view
set noerrorbells                " Grrrr.
set visualbell t_vb=            " There we go.
set autoindent                  " Copy indent from current line when starting a new line
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2
set tabstop=2
set hlsearch                    " Highlight search results
set ignorecase                  " When doing a search, ignore the case of letters
set smartcase                   " Override the ignorecase option if the search pattern contains upper case letters
set incsearch                   " show search results while typing
set showmatch
set backupdir=~/.vim/backup     " Don't litter swp files everywhere
set directory=~/.vim/backup
"Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>
" Fix .md -> markdown highlighting
au BufRead,BufNewFile *.md set filetype=markdown
set backspace=indent,eol,start  " Add tweak for better backspace support
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
" Enable cursor crosshair
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
" Disable toolbars, menus, scrollbars in gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"-- End General options --

"-- Custom Keybindings --

" ctrl-pgup -> previous buffer
map [5^ :bprev<CR>
map <C-PageUp> :bprev<CR>
" ctrl-pgdn -> next buffer
map [6^ :bnext<CR>
map <C-PageDown> :bnext<CR>

" C-c as <ESC>
inoremap <C-c> <ESC>

" Shift-tab as deindent; familiar from e.g. Sublime text
inoremap <S-Tab> <C-d>

" Ctrl-w closes a 'tab' in normal mode
nmap <C-w> :bdelete<CR>

"-- End Custom Keybindings --

"-- Custom :commands --

" case-insensitive w and q
:command WQ wq
:command Wq wq
:command W w
:command Q q

" alt-arrows for window / pane navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"Remove trailing whitespace
:command Untrail %s/\s\+$//g

" Sudo power!
cmap w!! w !sudo tee > /dev/null %

"-- End Custom :commands --

"-- Plugin-specific stuff --

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
" Fix molokai/monokai background color, as my urxvt has the correct bg :3
" hi Normal ctermbg=None

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-promptline
let g:promptline_theme = 'airline'
" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
        \'a' : [ '$(hostname)' ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd(), promptline#slices#vcs_branch() ]}
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga :EasyAlign

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga :EasyAlign

"-- End Plugin-specific stuff

" Fix font on gvim
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
