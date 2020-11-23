" This is mostly stolen from https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim

set noshowmode

" Uses spaces instead of tabs
set shiftwidth=4
set tabstop=4
set expandtab

" Run :PlugInstall
call plug#begin()

" Color
Plug 'morhetz/gruvbox'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
"Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"Plug 'rhysd/vim-clang-format'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/dbext.vim'

call plug#end()

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" coc
let g:coc_config_home="$HOME/.dotfiles/configs/nvim"

" Rust
"let g:LanguageClient_serverCommands = {
"\ 'rust': ['rust-analyzer'],
"\ }

" C
let g:clang_format#auto_format = 1
let g:ale_linters = {'c': ['gcc']}
let g:airline#extensions#ale#enabled = 1

" racer + rust
" https://github.com/rust-lang/rust.vim/issues/192
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
"let g:racer_cmd = "/usr/bin/racer"
"let g:racer_experimental_completer = 1
"let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"
"let $CARGO_TARGET_DIR = systemlist("env")
let $CARGO_TARGET_DIR=$HOME . "/.cargo-target"

" Color stuff
syntax on
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

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

" GUI settings
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
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

