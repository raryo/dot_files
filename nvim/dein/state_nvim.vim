if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/rshimura/.config/nvim,/etc/xdg/nvim,/Users/rshimura/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/rshimura/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/rshimura/.config/nvim/after,/Users/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/rshimura/dot_files/nvim/init.vim', '/Users/rshimura/dot_files/nvim/plugins.toml', '/Users/rshimura/dot_files/nvim/plugins_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/rshimura/dot_files/nvim/dein'
let g:dein#_runtime_path = '/Users/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/rshimura/dot_files/nvim/dein/.cache/init.vim'
let &runtimepath = '/Users/rshimura/.config/nvim,/etc/xdg/nvim,/Users/rshimura/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/vimproc.vim,/Users/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/Users/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/rshimura/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/rshimura/.config/nvim/after'
filetype off
    call denite#custom#map( 'insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
	call denite#custom#map( 'insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map( 'insert', '<C-j>', '<denite:assign_next_text>', 'noremap')
	call denite#custom#map( 'insert', '<C-k>', '<denite:assign_previous_text>', 'noremap')
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#manual_complete()
    function! s:check_back_space() abort "{{{
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <expr><C-g> deoplete#undo_comcletion()
    inoremap <expr><C-l> deoplete#refresh()
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
      return deoplete#cancel_popup() . "\<CR>"
    endfunction
    inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"
    inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_delay = 0
    let g:deoplete#keyword_patterns = {}
    let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
    let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.python = ''
    let g:deoplete#omni#functions = {}
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#skip_chars = ['(', ')']
   set completeopt-=preview
