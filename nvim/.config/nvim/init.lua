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
--  use 'tpope/vim-fugitive'           -- Git integration
  use 'airblade/vim-gitgutter'       -- Git diff in the gutter
  use 'nvim-lua/plenary.nvim'        -- Required for Copilot Chat
  use 'echasnovski/mini.icons'
  use 't9md/vim-chef'
  use 'weizheheng/nvim-workbench'
  use 'NeogitOrg/neogit'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Yggdroot/indentLine'
  use 'yegappan/taglist'
  use 'DaikyXendo/nvim-material-icon'
  use 'p00f/nvim-ts-rainbow'
  use 'dense-analysis/ale'
  use 'preservim/tagbar'
  use 'preservim/nerdtree'
  use { "catppuccin/nvim", as = "catppuccin" }
--  use 'vimpostor/vim-tpipeline'
--
  use({
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  })

  -- configure lua-line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- configure nvim-autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

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

--  -- configure copilot.vim
  use {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = 1
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
