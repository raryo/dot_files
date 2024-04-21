-- utility variables
local opts = { noremap = true, silent = true}
local term_opts = {silent =true}
local kmap = vim.api.nvim_set_keymap

-- map leader
kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal = n
--  insert = i
--  visual = v
--  via_block = x
--  term = t
--  cmd = c
-- e.g.
--  kmap("n", "<C-h", "<C-w>h", opts)

-- emacs like keybinds
kmap("i", "<C-b>", "<LEFT>", opts)
kmap("i", "<C-f>", "<RIGHT>", opts)
kmap("i", "<C-d>", "<DEL>", opts)
kmap("i", "<C-]>", "<ESC>", opts)
kmap("i", "<C-e>", "<END>", opts)
kmap("i", "<C-a>", "<HOME>", opts)
--kmap("i", "<C-n>", "<DOWN>", opts)
--kmap("i", "<C-p>", "<UP>", opts)

---- skkeleton
kmap('i', 'jj', '<Plug>(skkeleton-enable)', opts)
kmap('c', 'jj', '<Plug>(skkeleton-enable)', opts)


---- normal
kmap("n", "<ESC><ESC>", ":noh<CR>", opts)
kmap("n", "<C-f>", "<C-d>", opts)
kmap("n", "<C-b>", "<C-u>", opts)
kmap("n", "<C-j>", "i<CR><ESC>", opts)
kmap("n", "<C-m>", "i<CR><ESC>", opts)
kmap("n", ";", ":", opts)
kmap("n", ":", ";", opts)
kmap("n", "Y", "y$", opts)
kmap("n", "<C-w>n", ":bn", opts)
kmap("n", "<C-w>p", ":bp", opts)


-- visual
kmap("v", ";", ":", opts)
kmap("v", ":", ";", opts)


