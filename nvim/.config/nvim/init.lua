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
  use 'dstein64/vim-startuptime'       -- Startup time analysis

  -- UI Enhancements
  use 'ray-x/guihua.lua'                -- GUI support for floating terminal
  use 'akinsho/bufferline.nvim'         -- Buffer tabs
  use 'nvim-lualine/lualine.nvim'       -- Statusline
  use 'windwp/nvim-autopairs'           -- Autopairs for brackets and quotes
  use 'echasnovski/mini.icons'          -- Provides icons for Neovim's Mini plugin suite.
  use 'DaikyXendo/nvim-material-icon'   -- A plugin that provides Material Design icons for Neovim.
  use 'nvim-tree/nvim-web-devicons' -- File icons
  use 'romainl/vim-cool'              -- Disables search highlighting when you start typing
  use 'jlanzarotta/bufexplorer'         -- A plugin for easily switching between open buffers.
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  -- Git & File Management
  use 'airblade/vim-gitgutter'           -- Git diff in the gutter
  use 'neogitorg/neogit'                 -- Git integration
  use 'preservim/tagbar'                 -- Tag viewer
  use 'liuchengxu/vista.vim'             -- Provides a tag-based viewer similar to Tagbar.
  use 'wbthomason/packer.nvim'      -- packer itself
  use 'preservim/nerdtree'         -- the tree explorer
  use 'ms-jpq/chadtree' -- A fast and powerful file explorer for Neovim
  use({
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  })
  use 'kyazdani42/nvim-web-devicons' -- lua icon library
  use 'ryanoasis/vim-devicons'     -- vim icon library
  use 'tiagofumo/vim-nerdtree-syntax-highlight' -- Syntax highlighting for NERDTree
  use 'Xuyuanp/nerdtree-git-plugin'      -- Git integration for NERDTree
  use 'PhilRunninger/nerdtree-buffer-ops' -- Buffer operations for NERDTree
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
  --use 'neoclide/coc.nvim' -- Intellisense engine
  use 'neovim/nvim-lspconfig'           -- LSP Config
  use { 'mihyaeru21/nvim-ruby-lsp', requires = 'neovim/nvim-lspconfig' }
  use 'hrsh7th/nvim-cmp'                -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'              -- Buffer completions
  use 'hrsh7th/cmp-path'                -- Path completions
  use 'saadparwaiz1/cmp_luasnip'        -- LuaSnip completions
  use 'L3MON4D3/LuaSnip'                -- Snippets engine
  use 't9md/vim-chef'                   -- Chef syntax highlighting
  use 'honza/vim-snippets'              -- Snippets collection
  use 'jose-elias-alvarez/null-ls.nvim' -- For formatters and linters
  use {                                 -- completions for : commands
    'gelguy/wilder.nvim',
    config = function()
      -- config goes here
    end,
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
        win = {
          border = "rounded", -- or "double", "rounded"
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




  --use 'nvim-neotest/nvim-nio'
  --use {
  --  'nvim-neotest/neotest',
  --  requires = {
  --    'nvim-lua/plenary.nvim',
  --    'nvim-treesitter/nvim-treesitter',
  --    'olimorris/neotest-rspec',   -- for RSpec
  --    'nvim-neotest/neotest-go',   -- if you also want Go support
  --  },
  --  config = function()
  --    -- this will only run after the plugin is loaded
  --    require("plugin_config.neotest")
  --  end,
  --}

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

require("plugin_config/nerdtree")
require("plugin_config/which-key")
require("plugin_config/trouble")
require("plugin_config/telescope")
require("plugin_config/ruby-chef")
require("plugin_config/oil")
require("plugin_config/neogit")
require("plugin_config/lualine")
require("plugin_config/keybindings")
require("plugin_config/indentline")
require("plugin_config/gitgutter")
require("plugin_config/defaults")
require("plugin_config/dap")
require("plugin_config/copilot_and_copilot_chat")
require("plugin_config/catppuccin")
require("plugin_config/packer_compiled")
require("plugin_config/lsp_and_completion")
require("plugin_config/chadtree")
require("null-ls")
