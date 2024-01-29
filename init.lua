vim.cmd([[
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
set clipboard+=unnamedplus

" Coding style
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent

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

:command Untrail %s/\s\+$//ge

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'tanvirtin/monokai.nvim'
Plug 'neovim/nvim-lspconfig'
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

" Syntax highlighting stuff
syntax on
colorscheme monokai

" Clear the background, use terminal bg
:hi Normal guibg=none ctermbg=none
:hi LineNr guibg=none ctermbg=none
:hi Folded guibg=none ctermbg=none
:hi NonText guibg=none ctermbg=none
:hi SpecialKey guibg=none ctermbg=none
:hi VertSplit guibg=none ctermbg=none
:hi SignColumn guibg=none ctermbg=none
:hi EndOfBuffer guibg=none ctermbg=none
]])

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

