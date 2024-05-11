--require("lazy").setup("plugins", {
--  performance = {
--    rtp = {
--      disabled_plugins = {
--        "netrw",
--        "netrwPlugin",
--        "netrwSettings",
--        "netrwFileHandlers",
--      },
   -- },
--  },
--})
--require("lazy").setup("plugins")



return {

  ---------------------------
  -- colorscheme
  -- ------------------------
	{
    "EdenEast/nightfox.nvim",
	  lazy = false,
	  priority = 1000,
	  config = function()
      require('nightfox').setup({options={transparent=true}})
    end,
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

  {
    'shellRaining/hlchunk.nvim',
    event = {'UIEnter' },
    config = function()
      require('hlchunk').setup({})
    end
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
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'hrsh7th/cmp-cmdline'
  },
  {
    'rinx/cmp-skkeleton'
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-g>'] = cmp.mapping.abort(),
          ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<DOWN>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                  local entry = cmp.get_selected_entry()
                  -- if not entry then
                  --   cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                  -- end
                  -- cmp.complete()
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    fallback()
                end
            end
          }),
          ['<C-p>'] = cmp.mapping({
              c = function()
                  if cmp.visible() then
                      cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                  else
                      vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                  end
              end,
              i = function(fallback)
                  if cmp.visible() then
                    -- local entry = cmp.get_selected_entry()
                    -- if not entry then
                    --   cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    -- end
                    -- cmp.confirm()
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                  else
                      fallback()
                  end
              end
          }),
        }),
        sources = cmp.config.sources({
          {name = 'skkeleton'},
          {name = 'buffer'},
        })
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline({ ':' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }) 
      })
    end,
  },

  ------------------------------------------
  -- coding support
  -- ---------------------------------------
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

}


