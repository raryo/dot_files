require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})



return {

  ---------------------------
  -- colorscheme
  -- ------------------------
	{
	  "EdenEast/nightfox.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
	} ,
  ----------------
  -- UI
  ------------------
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      vim.cmd('colorscheme nightfox')
      require('lualine').setup()
    end,
  },

  -----------------------
  -- Motion
  -- --------------------
  {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
    keys = {
      --{ 'f', function() require('hop').hint_char1({direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true}) end, },
      --{ 't', function() require('hop').hint_char1({direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1}) end, },
      { 'f', function() vim.cmd([[HopWordCurrentLine]]) end, },
      { '<leader>l', function() vim.cmd([[HopLineStart]]) end, desc='Go to line head'},
    },
  },

  ---------------------
  -- filer
  -- ------------------
  --
  
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files", },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers opend", },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers opend", },
      { "<leader>fr", function() require("telescope").load_extension('file_browser').file_browser() end, desc = "Open File browser", },
      { "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "FZ search of current buffer", },

    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    config = function()
      require("telescope").load_extension "file_browser"
      require("telescope").load_extension "fzy_native"
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim",}
  },

  ------------------
  -- IME
  -- ---------------

  {
    "vim-denops/denops.vim",
  },

  {
    'vim-skk/skkeleton',
    dependencies = { 'vim-denops/denops.vim' },
    config = function()
        vim.fn['skkeleton#config']({globalDictionaries={'~/apps/skk/SKK-JISYO.L'}}) 
    end,
  },

  ---------------------
  -- completion
  -- ------------------
  {
   'Shougo/ddc-ui-native' ,
   --'Shougo/pum.vim',
   lazy=false,
  },
  {
   'tani/ddc-fuzzy' 
  },
  
  {
   'Shougo/ddc-source-around' 
  },

  {
    'Shougo/ddc.vim',
    dependencies = { 'vim-denops/denops.vim' },
    config = function()
      --vim.fn['ddc#custom#patch_global']('ui', 'pum')
      vim.fn['ddc#custom#patch_global']('ui', 'native')
      vim.fn['ddc#custom#patch_global']('sources', {'skkeleton', 'around'})
      vim.fn['ddc#custom#patch_global']('sourceOptions', {
                 _= {
                   matchers= {'matcher_fuzzy'},
                   sorters= {'sorter_fuzzy'},
                   converters= {'converter_fuzzy'},
                 },
                 skkeleton= {
                   mark='skk',
                   matchers= {},
                   sorters= {},
                   converters= {},
                   isVolatile=true,
                   minAutoCompleteLength= 1,
                 },
                 around= {
                   mark='A'
                 },
       })
      vim.fn['ddc#enable']()
    end,
  },
}
