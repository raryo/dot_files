if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/rshimura/.config/nvim,/etc/xdg/nvim,/home/rshimura/.local/share/nvim/site,/home/rshimura/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/rshimura/.local/share/flatpak/exports/share/nvim/site/after,/home/rshimura/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/rshimura/.config/nvim/after,/usr/share/vim/vimfiles,/home/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/rshimura/.config/nvim/init.vim', '/home/rshimura/dot_files/nvim/plugins.toml', '/home/rshimura/dot_files/nvim/plugins_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/rshimura/dot_files/nvim/dein'
let g:dein#_runtime_path = '/home/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/rshimura/dot_files/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/rshimura/.config/nvim,/etc/xdg/nvim,/home/rshimura/.local/share/nvim/site,/home/rshimura/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/vimproc.vim,/home/rshimura/dot_files/nvim/dein/repos/github.com/Shougo/dein.vim,/home/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/rshimura/dot_files/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/rshimura/.local/share/flatpak/exports/share/nvim/site/after,/home/rshimura/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/rshimura/.config/nvim/after,/usr/share/vim/vimfiles'
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
    let g:deoplete#sources#jedi#python_path = '/Users/rshimura/.pyenv/shims/python'
