-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- Additional useful plugins for development
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'xml' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'lewis6991/hover.nvim',
    config = function()
      require('hover').setup {
        init = function()
          require 'hover.providers.lsp'
          require 'hover.providers.gh'
          require 'hover.providers.gh_user'
          require 'hover.providers.jira'
          require 'hover.providers.man'
          require 'hover.providers.dictionary'
        end,
        preview_opts = {
          border = 'single',
        },
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP',
        },
        mouse_delay = 1000,
      }

      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
      vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
      vim.keymap.set('n', '<C-p>', function()
        require('hover').hover_switch 'previous'
      end, { desc = 'hover.nvim (previous source)' })
      vim.keymap.set('n', '<C-n>', function()
        require('hover').hover_switch 'next'
      end, { desc = 'hover.nvim (next source)' })

      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })
      vim.o.mousemoveevent = true
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          separator_style = 'slant',
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          color_icons = true,
        },
      }
    end,
  },

  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_keymap_toggle = '<F1>'
      vim.g.floaterm_keymap_new = '<F2>'
      vim.g.floaterm_keymap_prev = '<F3>'
      vim.g.floaterm_keymap_next = '<F4>'
      vim.g.floaterm_keymap_kill = '<F5>'
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintype = 'float'
      vim.g.floaterm_position = 'center'
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_title = ' Terminal $1/$2 '
      
      -- Additional keymaps
      vim.keymap.set('n', '<leader>ft', ':FloatermToggle<CR>', { desc = 'Toggle floating terminal' })
      vim.keymap.set('n', '<leader>fn', ':FloatermNew<CR>', { desc = 'New floating terminal' })
      vim.keymap.set('t', '<leader>ft', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle floating terminal' })
    end,
    keys = {
      { '<F1>', ':FloatermToggle<CR>', desc = 'Toggle floating terminal', mode = { 'n', 't' } },
      { '<F2>', ':FloatermNew<CR>', desc = 'New floating terminal' },
      { '<F3>', ':FloatermPrev<CR>', desc = 'Previous floating terminal' },
      { '<F4>', ':FloatermNext<CR>', desc = 'Next floating terminal' },
      { '<F5>', ':FloatermKill<CR>', desc = 'Kill floating terminal' },
      { '<leader>ft', ':FloatermToggle<CR>', desc = 'Toggle floating terminal' },
      { '<leader>fn', ':FloatermNew<CR>', desc = 'New floating terminal' },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },

  -- Git graph visualization
  {
    'isakbm/gitgraph.nvim',
    dependencies = { 'sindrets/diffview.nvim' },
    opts = {
      symbols = {
        merge_commit = 'M',
        commit = '*',
        merge_commit_end = 'M',
        commit_end = '*',

        -- Advanced symbols
        GVER = '│',
        GHOR = '─',
        GCLD = '╮',
        GCRD = '╭',
        GCLU = '╯',
        GCRU = '╰',
        GLRU = '┴',
        GLRD = '┬',
        GLUD = '┤',
        GRUD = '├',
        GFORKU = '┼',
        GFORKD = '┼',
        GRUDCD = '├',
        GRUDCU = '├',
        GLUDCD = '┤',
        GLUDCU = '┤',
        GLRDCL = '┬',
        GLRDCR = '┬',
        GLRUCL = '┴',
        GLRUCR = '┴',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        '<leader>gl',
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = 'GitGraph - draw',
      },
    },
  },

  -- Minuet AI - AI-powered code completion
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
        -- Use OpenRouter with Mistral's devstral-small:free model
        provider = 'openai_compatible',
        provider_options = {
          openai_compatible = {
            model = 'mistralai/devstral-small:free',
            system = 'You are a helpful assistant',
            few_shots = 5,
            end_point = 'https://openrouter.ai/api/v1/chat/completions',
            api_key = function()
              return vim.fn.getenv('OPENROUTER_API_KEY')
            end,
            name = 'OpenRouter',
            optional = {
              ['HTTP-Referer'] = 'https://github.com/milanglacier/minuet-ai.nvim',
              ['X-Title'] = 'Minuet AI for Neovim',
            },
          },
        },
        -- Completion settings
        throttle = 500, -- Throttle time in milliseconds
        minimum_prefix_length = 2, -- Minimum characters before triggering completion
        debounce = 400, -- Debounce time in milliseconds
        request_timeout = 3, -- Request timeout in seconds
        -- Window settings
        window = {
          max_height = 10,
          max_width = 0.45,
          border = 'rounded',
          winblend = 0,
        },
        -- Virtual text settings (for inline suggestions)
        virtual_text = {
          enabled = true,
          hl_group = 'Comment',
        },
        -- Accept settings
        auto_trigger_context_length = 30, -- Characters of context to include
        -- Notification settings
        notify = 'verbose', -- 'verbose', 'warn', 'error', 'off'
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
