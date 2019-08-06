let mapleader = "\<Space>"
let g:python_host_prog = '~/.pyenv/versions/2.7.14/bin/python'
"let g:python3_host_prog  =  '~/.pyenv/versions/anaconda3-5.0.0/bin/python'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/dot_files/nvim/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/other_works/python/studio.nvim

" Required:
if dein#load_state('~/dot_files/nvim/dein')
  call dein#begin('~/dot_files/nvim/dein')
  " begin mng
  let g:config_dir = expand('~/dot_files/nvim')
  let s:toml       = g:config_dir . '/plugins.toml'
  let s:lazy_toml  = g:config_dir . '/plugins_lazy.toml'
  " read toml
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('chriskempson/base16-vim')
  
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim')
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" Plugin key-mappings.
"


" ALE preference
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['flake8'],
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)
"END""""""""""""""""""""""""""""""""""""""""


"quickrun
" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'split' : '',
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
        \ 'outputter/buffer/close_on_empty' : 1,
    \ },
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
nnoremap <Leader><Space> :cclose<CR>:write<CR>V:QuickRun -mode v<CR>
xnoremap <Leader>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>


"jedi"""""""""""""""""""""""""""""""""""""
let g:jedi#rename_command = "<leader>R"

set encoding=utf-8
scriptencoding= utf-8


set tabstop=4
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set hls
set nocompatible

set number
set title
set showmatch
set cursorline
set ruler

set statusline=%F%m%r%=[%l/%L,%c]
set laststatus=2

set backspace=start,eol,indent
set mouse=a

set wildmenu wildmode=list:full

set directory=~/.vimdot
set backup
set backupdir=~/.vimdot

"set clipboard=unnamed,autoselect
set hidden

set complete=.
set infercase
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-d> <DEL>
inoremap <C-r> <C-r>"
inoremap <C-]> <ESC>
inoremap <C-c> <C-x>
"vnoremap <C-c> "+y
nnoremap <C-p> "+p
nnoremap <ESC><ESC> :noh<CR>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <C-f> <C-d>
nnoremap <C-b> <C-u>
nnoremap <C-m> i<CR><ESC>^
" denite maps
nnoremap <Leader>h :Denite buffer -highlight-matched-char=Underlined -highlight-mode-insert=WildMenu<CR>
nnoremap <Leader>f :Denite file -highlight-matched-char=Underlined -highlight-mode-insert=WildMenu<CR>
nnoremap <Leader>l :Denite grep -highlight-matched-char=Underlined<CR>

syntax enable
"set termguicolors
set t_Co=256
"let base16colorspace=256
colorscheme Tomorrow-night
"colorscheme base16-tomorrow-night
"colorscheme nord
"color dracula
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
"
"set indent width
filetype plugin on
filetype indent on
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType js setlocal sw=2 sts=2 ts=2 et
autocmd FileType html setlocal sw=2 sts=2 ts=2 et
autocmd FileType python inoremap ; :
