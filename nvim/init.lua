require('lazy_nvim_bootstrap')
require('keymaps')
require('colorscheme')
require("lazy").setup("plugins")
require('plugins')


-- common setting
-- encoding
vim.o.encofing = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
--vim.o.ambiwidth = 'double'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.cmd("set termguicolors")
vim.cmd("colorscheme nightfox")

vim.o.visualbell = false
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- autocmd
local autocmd = vim.api.nvim_create_autocmd
autocmd({'FileType'}, {
	pattern = 'javascript',
	command = 'setlocal sw=2 sts=2 ts=2 et'
})
autocmd({'FileType'}, {
	pattern = 'lua',
	command = 'setlocal sw=2 sts=2 ts=2 et'
})
autocmd({'FileType'}, {
	pattern = 'toml',
	command = 'setlocal sw=2 sts=2 ts=2 et'
})
