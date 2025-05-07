-- Ensure Packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
end
ensure_packer()
vim.cmd [[packadd packer.nvim]]  -- force load Packer explicitly

require('packer').startup(function(use)

  -- Core Plugins
  use 'nvim-lua/plenary.nvim'            -- Required by some plugins
  use 'nvim-lua/popup.nvim'              -- Popup utilities

  -- Git & File Management
  use 'airblade/vim-gitgutter'           -- Git diff in the gutter
  use 'neogitorg/neogit'                 -- Git integration
  use 'preservim/tagbar'                 -- Tag viewer
  use 'liuchengxu/vista.vim'             -- Provides a tag-based viewer similar to Tagbar.
  use 'preservim/nerdtree'               -- File explorer
  use 'tpope/vim-fugitive'               -- Classic git integration
  use {
  'akinsho/toggleterm.nvim',
  tag = '*',
  config = function()
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = 'float', -- or 'vertical' | 'float'
    }
  end
}

  -- LSP & Completion
  use 'neovim/nvim-lspconfig'           -- LSP Config
  use 'hrsh7th/nvim-cmp'                -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'              -- Buffer completions
  use 'hrsh7th/cmp-path'                -- Path completions
  use 'saadparwaiz1/cmp_luasnip'        -- LuaSnip completions
  use 'L3MON4D3/LuaSnip'                -- Snippets engine
  use 't9md/vim-chef'                   -- Chef syntax highlighting
  use 'honza/vim-snippets'              -- Snippets collection
  use {                                 -- completions for : commands
    'gelguy/wilder.nvim',
    config = function()
      -- config goes here
    end,
  }

  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
        goimports = 'gopls',  -- Use gopls for goimports
        gofmt = 'gopls',      -- Use gopls for gofmt
        tag_transform = false, -- Don't automatically transform Go tags
        comment_placeholder = '   ', -- Placeholder for comments in Go files
        test_dir = '',        -- Set the test directory if needed
        lsp_cfg = true,       -- Use nvim-lspconfig settings for go
        lsp_gofumpt = true,   -- Enable gofumpt (gopls formatting tool)
        lsp_on_attach = true, -- Use on_attach from go.nvim for LSP setup
        dap_debug = true,     -- Enable debugging for Go
      })
    end
  }

  use {
    'williamboman/mason.nvim',
    config = function()
        require("mason").setup()
    end
  }

  -- Snippet and Autocompletion Setup
  use {
    'benfowler/telescope-luasnip.nvim',
    config = function()
      require("telescope").load_extension("luasnip")
      require('telescope').load_extension('terraform')
      require('telescope.builtin')
    end
  }

  -- Syntax Highlighting and Treesitter
  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting and treesitter
  use 'Yggdroot/indentLine'             -- Indentation guide lines

  -- Debugging & Testing
  use 'mfussenegger/nvim-dap'           -- Debug Adapter Protocol
  use 'theHamsta/nvim-dap-virtual-text' -- Debugger virtual text
  use 'aquasecurity/vim-tfsec'          -- A plugin that provides Terraform security linting.

  -- UI Enhancements
  use 'ray-x/guihua.lua'                -- GUI support for floating terminal
  use 'akinsho/bufferline.nvim'         -- Buffer tabs
  use 'nvim-lualine/lualine.nvim'       -- Statusline
  use 'windwp/nvim-autopairs'           -- Autopairs for brackets and quotes
  use 'echasnovski/mini.icons'          -- Provides icons for Neovim's Mini plugin suite.
  use 'DaikyXendo/nvim-material-icon'   -- A plugin that provides Material Design icons for Neovim.
  use 'jlanzarotta/bufexplorer'         -- A plugin for easily switching between open buffers.
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  -- Config customizations
  use "folke/neoconf.nvim"

  -- Fuzzy Finder and Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    config = function()
      require('telescope').setup{
        extensions = {
          file_browser = {
            -- configuration options for file_browser extension
          },
        },
      }
      -- Load the file_browser extension
      require('telescope').load_extension('file_browser')
    end,
  }

  use { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'make' 
  }
  use { 
    'junegunn/fzf', 
    run = './install --all'  -- same as fzf#install()
  }

  use 'junegunn/fzf.vim'
  use 'nvim-telescope/telescope-ui-select.nvim'    -- UI Select for Telescope

  -- Miscellaneous
  use 'catppuccin/nvim'                   -- Color scheme
  use 'sbulav/telescope-terraform.nvim'   -- Terraform telescope extension
  use 'stevearc/oil.nvim'                 -- File management and preview
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- You can add options here
        window = {
          border = "single", -- or "double", "rounded"
        },
      })
    end
  }

  -- Copilot-CMP (lets Copilot suggestions show in completion menu)
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
  }

  -- GitHub Copilot (Lua version)
  use {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter", -- lazy-load Copilot when starting to type
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        filetypes = {
          markdown = true,
          gitcommit = true,
          ["*"] = true,
        },
      })
    end,
  }

  -- CopilotChat (chat interface)
  use {
    "CopilotC-Nvim/CopilotChat.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    run = "make tiktoken",
    config = function()
      require("copilotchat").setup({
        window = {
          layout = "float",  -- Make the window a floating window
          width = 120,       -- Width of the floating window
          height = 20,       -- Height of the floating window
          border = "rounded", -- Border style for the window
        },
      })
    end,
  }
end)

