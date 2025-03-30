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

-- install required packages
require('packer').startup(function(use)
  use 'tpope/vim-fugitive'           -- Git integration
  use 'airblade/vim-gitgutter'       -- Git diff in the gutter
  use 'vim-ruby/vim-ruby'            -- Ruby support
  use 'tpope/vim-endwise'            -- Endwise plugin for auto-closing blocks
  use 'nvim-lua/plenary.nvim'        -- Required for Copilot Chat
  use 'vim-airline/vim-airline'      -- Airline status line plugin
  use 'vim-airline/vim-airline-themes' -- Airline themes for different looks
  use 'echasnovski/mini.icons'
  use 'nvim-tree/nvim-web-devicons'
  use 't9md/vim-chef'
  use 'weizheheng/nvim-workbench'
  use 'NeogitOrg/neogit'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Yggdroot/indentLine'
  use 'yssl/QFEnter'

      -- configure telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
        {'nvim-lua/plenary.nvim'},
        { "sbulav/telescope-terraform.nvim" }
    }
  }

  -- telescope-file-browser stuff
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- configure oil
  use {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end
  }

  -- configure copilot-chat
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = "make tiktoken",
    requires = {{'github/copilot.vim'}, {'nvim-lua/plenary.nvim', branch = 'master'}},
  }

  -- configure copilot.vim
  use {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = 1
    end
  }

  -- setup ayi-vim theme
  use {
    'ayu-theme/ayu-vim',
    config = function()
      vim.g.ayucolor="mirage"
      vim.cmd('colorscheme ayu')
    end
  }

  -- configure toggleterm.nvim
  use {
    "akinsho/toggleterm.nvim",  -- Toggleterm plugin
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-\>]],  -- Define the keybinding to toggle the terminal
        direction = 'float',       -- 'horizontal', 'vertical', or 'float'
        shell = vim.o.shell,
        close_on_exit = true
      }
    end
  }
end)

local neogit = require('neogit')
neogit.setup {}
