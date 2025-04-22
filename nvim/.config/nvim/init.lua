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
--  -- use 'tpope/vim-fugitive'           -- Git integration
--  -- use 'vimpostor/vim-tpipeline'
  use 't9md/vim-chef'
  use 'nvim-treesitter/nvim-treesitter'
  use 'airblade/vim-gitgutter'       -- Git diff in the gutter
  use 'nvim-lua/plenary.nvim'        -- Required for Copilot Chat
  use 'echasnovski/mini.icons'
  use 'weizheheng/nvim-workbench'
  use 'kuznetsss/shswitch'
  use 'aquasecurity/vim-tfsec'
  use 'honza/vim-snippets'
  use 'jlanzarotta/bufexplorer'
  use 'NeogitOrg/neogit'
  use 'Yggdroot/indentLine'
  use 'liuchengxu/vista.vim'
  use 'yegappan/taglist'
  use 'DaikyXendo/nvim-material-icon'
  use 'dense-analysis/ale'
  use 'preservim/tagbar'
  use 'nvim-tree/nvim-web-devicons'
  use 'sbulav/telescope-terraform.nvim'
  use 'preservim/nerdtree'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'VonHeikemen/lsp-zero.nvim'
--  use 'williamboman/mason.nvim'
--  use 'danchoi/ri.vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
--
  use {
    'junegunn/fzf',
    run = './install --all'  -- same as fzf#install()
  }
--
  use 'junegunn/fzf.vim'
  vim.keymap.set("n", "<leader>r", "<cmd>Rg<cr>", { desc = "(ripgrep to search file contents)" })
--
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }, -- optional dependency
    cmd = { 'Trouble' },
    config = function()
      require("trouble").setup {} -- empty opts for default config
      -- Keybindings
      vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
      vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
      vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
      vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ..." })
      vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
      vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
    end
  }

  --
--
--  -- use({
--  --   "aserowy/tmux.nvim",
--  --   config = function() return require("tmux").setup() end
--  -- })

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
  use 'nvim-telescope/telescope-symbols.nvim'
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
        {'nvim-lua/plenary.nvim'},
    }
  }
--
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
--
   -- configure copilot.vim
  use {
      'github/copilot.vim',
      config = function()
        require("copilot").setup({})
      end
    }

  -- -- configure copilot-chat
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    requires = {{'github/copilot.vim'}, {'nvim-lua/plenary.nvim', branch = 'master'}},
    config = function()
      require("copilot-chat").setup {
        build = "make tiktoken",
        opts = {}
      }
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
