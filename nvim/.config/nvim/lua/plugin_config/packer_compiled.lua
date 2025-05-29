-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/alexfreidah/.cache/nvim/packer_hererocks/2.1.1744317938/share/lua/5.1/?.lua;/Users/alexfreidah/.cache/nvim/packer_hererocks/2.1.1744317938/share/lua/5.1/?/init.lua;/Users/alexfreidah/.cache/nvim/packer_hererocks/2.1.1744317938/lib/luarocks/rocks-5.1/?.lua;/Users/alexfreidah/.cache/nvim/packer_hererocks/2.1.1744317938/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/alexfreidah/.cache/nvim/packer_hererocks/2.1.1744317938/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["CopilotChat.nvim"] = {
    config = { "\27LJ\2\n‡\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\4\vborder\frounded\vheight\3\20\nwidth\3x\vlayout\nfloat\nsetup\16copilotchat\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/CopilotChat.nvim",
    url = "https://github.com/CopilotC-Nvim/CopilotChat.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  bufexplorer = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/bufexplorer",
    url = "https://github.com/jlanzarotta/bufexplorer"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n²\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\14filetypes\1\0\3\rmarkdown\2\6*\2\14gitcommit\2\npanel\1\0\2\fenabled\2\17auto_refresh\2\15suggestion\1\0\3\14filetypes\0\15suggestion\0\npanel\0\vkeymap\1\0\4\fdismiss\n<C-]>\tnext\n<C-n>\vaccept\n<C-l>\tprev\n<C-p>\1\0\4\fenabled\2\vkeymap\0\rdebounce\3K\17auto_trigger\2\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["deoplete.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/deoplete.nvim",
    url = "https://github.com/Shougo/deoplete.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  indentLine = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/mason-org/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.icons"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/mini.icons",
    url = "https://github.com/echasnovski/mini.icons"
  },
  ["neoconf.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neoconf.nvim",
    url = "https://github.com/folke/neoconf.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/neogitorg/neogit"
  },
  neomake = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neomake",
    url = "https://github.com/neomake/neomake"
  },
  neotest = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-rspec"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neotest-rspec",
    url = "https://github.com/olimorris/neotest-rspec"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin",
    url = "https://github.com/Xuyuanp/nerdtree-git-plugin"
  },
  nvim = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-material-icon"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-material-icon",
    url = "https://github.com/DaikyXendo/nvim-material-icon"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["oil.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  syntastic = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/syntastic",
    url = "https://github.com/vim-syntastic/syntastic"
  },
  tagbar = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\3\0\6\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\1K\0\1\0\22telescope.builtin\14terraform\fluasnip\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-terraform.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-terraform.nvim",
    url = "https://github.com/sbulav/telescope-terraform.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nª\1\0\0\5\0\b\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\a\0'\2\4\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\1\15extensions\0\17file_browser\1\0\1\17file_browser\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tlib_vim = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/tlib_vim",
    url = "https://github.com/tomtom/tlib_vim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nÓ\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\b\17open_mapping\n<c-\\>\tsize\3\20\17persist_size\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\20shade_filetypes\0\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-addon-mw-utils"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-addon-mw-utils",
    url = "https://github.com/MarcWeber/vim-addon-mw-utils"
  },
  ["vim-chef"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-chef",
    url = "https://github.com/t9md/vim-chef"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-hug-neovim-rpc"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-hug-neovim-rpc",
    url = "https://github.com/roxma/vim-hug-neovim-rpc"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight",
    url = "https://github.com/tiagofumo/vim-nerdtree-syntax-highlight"
  },
  ["vim-ruby"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-ruby",
    url = "https://github.com/vim-ruby/vim-ruby"
  },
  ["vim-snipmate"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-snipmate",
    url = "https://github.com/garbas/vim-snipmate"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-terraform-completion"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-terraform-completion",
    url = "https://github.com/juliosueiras/vim-terraform-completion"
  },
  ["vim-tfsec"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-tfsec",
    url = "https://github.com/aquasecurity/vim-tfsec"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope-luasnip.nvim
time([[Config for telescope-luasnip.nvim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\3\0\6\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\1K\0\1\0\22telescope.builtin\14terraform\fluasnip\19load_extension\14telescope\frequire\0", "config", "telescope-luasnip.nvim")
time([[Config for telescope-luasnip.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: CopilotChat.nvim
time([[Config for CopilotChat.nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\4\vborder\frounded\vheight\3\20\nwidth\3x\vlayout\nfloat\nsetup\16copilotchat\frequire\0", "config", "CopilotChat.nvim")
time([[Config for CopilotChat.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nÓ\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20shade_filetypes\1\0\b\17open_mapping\n<c-\\>\tsize\3\20\17persist_size\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\20shade_filetypes\0\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nª\1\0\0\5\0\b\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\a\0'\2\4\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\1\15extensions\0\17file_browser\1\0\1\17file_browser\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
