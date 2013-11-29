"-- General --
set number            "Show line numbers
set ruler             "Show the line and column number of the cursor position
colorscheme monokai   "Set color scheme to monokai
syntax on             "and set it to use

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

"-- Tabbed Editing --

"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
