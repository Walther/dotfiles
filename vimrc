"-- General --
set number            "Show line numbers
set ruler             "Show the line and column number of the cursor position
let molokai_original = 1 "a nice variable for the theme...
colorscheme molokai   "set the color scheme to molokai...
syntax on             "and set it to use, yay colors <3
set mouse=a           "mouse scrolling, CLI can be modern!
set switchbuf=usetab,newtab "switch to existing buffers instead of forcing a new one in current view

" ctrl-pgup -> previous buffer
map [5^ :bprev
" ctrl-pgdn -> next buffer
map [6^ :bnext

"-- Programming --
set autoindent        "Copy indent from current line when starting a new line

"-- Spaces/Tabs --
set expandtab         "Use spaces instead of tabs
set shiftwidth=4
set tabstop=4

"-- Searching --
set hlsearch          "Highlight search results
set ignorecase        "When doing a search, ignore the case of letters
set smartcase         "Override the ignorecase option if the search pattern contains upper case letters
"Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>

"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
let g:airline#extensions#tabline#enabled = 1
" Always show statusline
set laststatus=2
" Fix molokai/monokai background color, as my urxvt has the correct bg :3
hi Normal ctermbg=None

" Fix .md -> markdown highlighting
au BufRead,BufNewFile *.md set filetype=markdown

