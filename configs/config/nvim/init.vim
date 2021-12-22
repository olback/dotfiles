"
" Plugins
"

" Run :PlugInstall
call plug#begin()

" Helpers
Plug 'nvim-lua/plenary.nvim'            " Helper functions

" Theme / Colors / Icons
Plug 'morhetz/gruvbox'                  " Main theme
Plug 'folke/lsp-colors.nvim'            " LSP Colors
Plug 'kyazdani42/nvim-web-devicons'     " Icons
Plug 'vim-airline/vim-airline'          " Status bar
Plug 'vim-airline/vim-airline-themes'

" Editor
Plug 'editorconfig/editorconfig-vim'    " Respect editorconfig
Plug 'ypcrts/securemodelines'           " Secure VIM modelines
Plug 'machakann/vim-highlightedyank'    " Highlight yanks
Plug 'airblade/vim-gitgutter'           " Show git diff in gutter

" Components
Plug 'folke/trouble.nvim'               " Trouble, list errors, warnings, info
Plug 'folke/todo-comments.nvim'         " Highligt TODO/FIXME

" Language
Plug 'rust-lang/rust.vim'               " Rust
Plug 'mattn/emmet-vim'                  " Emmet (HTML)

" LSP
Plug 'neovim/nvim-lspconfig'            " LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'

call plug#end()

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

"
" Triggers
"

" Rust + Cargo stuff
" Cargo.toml version checks
if has('nvim')
    autocmd BufRead Cargo.toml call crates#toggle()
endif
" format on write
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
" gilight 100:th column, rustfmt max_width
autocmd Filetype rust setlocal colorcolumn=100
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()


"
" Keyboard/Autoclose
"

" Ctrl+Del to delete word
imap <C-Del> X<Esc>dwi

" Clipboard stuff
set clipboard=unnamedplus

" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Code navigation shortcuts
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Trouble
nnoremap <silent>tw <cmd>Trouble workspace_diagnostics<cr>
nnoremap <silent>td <cmd>Trouble document_diagnostics<cr>
nnoremap <silent>tn <cmd>TodoTrouble<cr>
nnoremap <silent>tq <cmd>TroubleClose<cr>


"
" GUI settings / Other
"

" Color stuff
syntax on
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_soft'

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create(['hunks','branch'])
  let g:airline_section_c = airline#section#create_left(['file'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Other
filetype plugin indent on
set noshowmode " Don't show vim-mode i.e. --INSERT--,..
" Uses spaces instead of tabs
set shiftwidth=4
set tabstop=4
set expandtab
set list listchars=tab:→\ ,trail:·,extends:>,precedes:<
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
set cmdheight=2
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
" set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
"set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes
set termguicolors
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
set encoding=utf-8
set autoindent


"
" Lua
"

lua << EOF
require('init_lua')
EOF

