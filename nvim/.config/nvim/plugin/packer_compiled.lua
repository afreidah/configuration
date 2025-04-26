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
    config = { "\27LJ\2\ní\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\topts\vwindow\1\0\1\vwindow\0\1\0\1\vlayout\nfloat\1\0\2\nbuild\18make tiktoken\topts\0\nsetup\17copilot-chat\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/CopilotChat.nvim",
    url = "https://github.com/CopilotC-Nvim/CopilotChat.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nÖ\1\0\0\3\1\6\0\15-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\5Ä6\0\2\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\0¿\15<C-V><Tab>\15nvim_input\bapi\bvim\19expand_or_jump\23expand_or_jumpable\"\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjumpM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeã\3\1\0\a\0\22\0*6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\0036\4\0\0'\6\3\0B\4\2\0029\4\6\4=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\0015\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\0016\1\a\0009\1\b\0019\1\t\0015\3\14\0'\4\15\0003\5\16\0005\6\17\0B\1\5\0016\1\a\0009\1\b\0019\1\t\0015\3\18\0'\4\19\0003\5\20\0005\6\21\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\vsilent\2\0\n<C-E>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\f<S-Tab>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\n<Tab>\1\3\0\0\6i\6s\bset\vkeymap\bvim\fft_func\1\0\3\17load_ft_func\0\24enable_autosnippets\2\fft_func\0\17load_ft_func'luasnip_snippets.common.snip_utils\nsetup\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ale = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
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
  catppuccin = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcopilot\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
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
  indentLine = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["luasnip-snippets"] = {
    config = { "\27LJ\2\nP\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup'luasnip_snippets.common.snip_utils\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/luasnip-snippets",
    url = "https://github.com/mireq/luasnip-snippets"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.icons"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/mini.icons",
    url = "https://github.com/echasnovski/mini.icons"
  },
  neogit = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireù\1\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\0024\3\3\0005\4\b\0>\4\1\3=\3\t\2B\0\2\1K\0\1\0\fsources\1\0\1\tname\fluasnip\fsnippet\1\0\2\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
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
  ["nvim-workbench"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/nvim-workbench",
    url = "https://github.com/weizheheng/nvim-workbench"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  shswitch = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/shswitch",
    url = "https://github.com/kuznetsss/shswitch"
  },
  tagbar = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  taglist = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/taglist",
    url = "https://github.com/yegappan/taglist"
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
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fluasnip\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
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
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nõ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3=\3\6\2B\0\2\1K\0\1\0\nshell\6o\bvim\1\0\5\tsize\3\20\14direction\nfloat\nshell\0\18close_on_exit\2\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "\27LJ\2\nè\6\0\0\6\0\25\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\22\0'\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\tdesc\28Quickfix List (Trouble)#<cmd>Trouble qflist toggle<cr>\15<leader>xQ\1\0\1\tdesc\28Location List (Trouble)$<cmd>Trouble loclist toggle<cr>\15<leader>xL\1\0\1\tdesc'LSP Definitions / references / ...?<cmd>Trouble lsp toggle focus=false win.position=right<cr>\15<leader>cl\1\0\1\tdesc\22Symbols (Trouble)0<cmd>Trouble symbols toggle focus=false<cr>\15<leader>cs\1\0\1\tdesc!Buffer Diagnostics (Trouble)5<cmd>Trouble diagnostics toggle filter.buf=0<cr>\15<leader>xX\1\0\1\tdesc\26Diagnostics (Trouble)(<cmd>Trouble diagnostics toggle<cr>\15<leader>xx\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-chef"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-chef",
    url = "https://github.com/t9md/vim-chef"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/alexfreidah/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
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
  }
}

time([[Defining packer_plugins]], false)
-- Config for: CopilotChat.nvim
time([[Config for CopilotChat.nvim]], true)
try_loadstring("\27LJ\2\ní\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\topts\vwindow\1\0\1\vwindow\0\1\0\1\vlayout\nfloat\1\0\2\nbuild\18make tiktoken\topts\0\nsetup\17copilot-chat\frequire\0", "config", "CopilotChat.nvim")
time([[Config for CopilotChat.nvim]], false)
-- Config for: telescope-luasnip.nvim
time([[Config for telescope-luasnip.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fluasnip\19load_extension\14telescope\frequire\0", "config", "telescope-luasnip.nvim")
time([[Config for telescope-luasnip.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\3\1\6\0\15-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\5Ä6\0\2\0009\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\0¿\15<C-V><Tab>\15nvim_input\bapi\bvim\19expand_or_jump\23expand_or_jumpable\"\0\0\3\1\1\0\5-\0\0\0009\0\0\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjumpM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeã\3\1\0\a\0\22\0*6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\0036\4\0\0'\6\3\0B\4\2\0029\4\6\4=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\0015\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\0016\1\a\0009\1\b\0019\1\t\0015\3\14\0'\4\15\0003\5\16\0005\6\17\0B\1\5\0016\1\a\0009\1\b\0019\1\t\0015\3\18\0'\4\19\0003\5\20\0005\6\21\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\vsilent\2\0\n<C-E>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\f<S-Tab>\1\3\0\0\6i\6s\1\0\1\vsilent\2\0\n<Tab>\1\3\0\0\6i\6s\bset\vkeymap\bvim\fft_func\1\0\3\17load_ft_func\0\24enable_autosnippets\2\fft_func\0\17load_ft_func'luasnip_snippets.common.snip_utils\nsetup\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fcopilot\frequire\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: luasnip-snippets
time([[Config for luasnip-snippets]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup'luasnip_snippets.common.snip_utils\frequire\0", "config", "luasnip-snippets")
time([[Config for luasnip-snippets]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nõ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3=\3\6\2B\0\2\1K\0\1\0\nshell\6o\bvim\1\0\5\tsize\3\20\14direction\nfloat\nshell\0\18close_on_exit\2\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireù\1\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\0024\3\3\0005\4\b\0>\4\1\3=\3\t\2B\0\2\1K\0\1\0\fsources\1\0\1\tname\fluasnip\fsnippet\1\0\2\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Trouble', function(cmdargs)
          require('packer.load')({'trouble.nvim'}, { cmd = 'Trouble', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'trouble.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Trouble ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


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
