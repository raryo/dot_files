let mapleader = "\<Space>"
let g:python_host_prog = '/Users/rshimura/.pyenv/versions/nvim3/bin/python'
let g:python3_host_prog = '/Users/rshimura/.pyenv/versions/nvim2/bin/python'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/rshimura/.vim/./repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/rshimura/.vim/.')
let g:config_dir = expand('~/.vim/myconfig')
let s:toml       = g:config_dir . '/plugins.toml'
let s:lazy_toml  = g:config_dir . '/plugins_lazy.toml'
" read toml
call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"call dein#add('dracula/vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" Plugin key-mappings.



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

"Neocomplete"""""""""""""""""""""""""""""""
let g:neosnippet#snippets_directory='~/.vim/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'perl' : $HOME.'/.vim/dict/perl.dict'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
 " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
 
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" popup color config
highlight Pmenu guibg=#ff00ff
highlight PmenuSel ctermbg=1 
highlight PmenuSbar ctermbg=0 

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType perl setlocal omnifunc=perlcomplete#Complete
 
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"END"""""""""""""""""""""""""""""""""""""""""""""


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

syntax enable
set t_Co=256
"let g:solarized_termcolors=16
"let g:solarized_bold=0
"let g:solarized_underline=0
"let g:solarized_italic=0
"set background=dark
"colorscheme solarized
color dracula

