-- configure neoconf so we can have per project settings
require("neoconf").setup({
  -- name of the local settings files
  local_settings = ".neoconf.json",
  -- name of the global settings file in your Neovim config directory
  global_settings = "neoconf.json",
  -- import existing settings from other plugins
  import = {
    vscode = true, -- local .vscode/settings.json
    coc = true, -- global/local coc-settings.json
    nlsp = true, -- global/local nlsp-settings.nvim json settings
  },
  -- send new configuration to lsp clients when changing json settings
  live_reload = true,
  -- set the filetype to jsonc for settings files, so you can use comments
  -- make sure you have the jsonc treesitter parser installed!
  filetype_jsonc = true,
  plugins = {
    -- configures lsp clients with settings in the following order:
    -- - lua settings passed in lspconfig setup
    -- - global json settings
    -- - local json settings
    lspconfig = {
      enabled = true,
    },
    -- configures jsonls to get completion in .neoconf.json files
    jsonls = {
      enabled = true,
      -- only show completion in json settings for configured lsp servers
      configured_servers_only = true,
    },
    -- configures lua_ls to get completion of lspconfig server settings
    lua_ls = {
      -- by default, lua_ls annotations are only enabled in your neovim config directory
      enabled_for_neovim_config = true,
      -- explicitly enable adding annotations. Mostly relevant to put in your local .neoconf.json file
      enabled = false,
    },
  },
})

-- Set LSP capabilities (before server configs)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure each LSP server
local lspconfig = require('lspconfig')
local servers = {
  clangd = {},
  ruby_lsp = {},
  terraformls = {},
  tflint = {},
  yamlls = {},
  golangci_lint_ls = {},
  pylsp = {},
}

for server, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end

-- LSP keymaps when server attaches
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    local map = vim.keymap.set
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'go', vim.lsp.buf.type_definition, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'gs', vim.lsp.buf.signature_help, opts)
    map('n', '<F2>', vim.lsp.buf.rename, opts)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format { async = true } end, opts)
    map('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

-- Luasnip keybindings
local ls = require('luasnip')
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if ls.expand_or_jumpable() then ls.expand_or_jump() else vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true) end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then ls.change_choice(1) end
end, { silent = true })

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({}),
})

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"
  },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max_filesize
    end,
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.signcolumn = 'yes'

-- Optional: Setup Trouble
pcall(function()
  require("trouble").setup({})
end)

-- Optional: Setup Copilot CMP
pcall(function()
  require("copilot_cmp").setup()
end)

-- setup Wilder for command line completion
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
  }),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
  }),
}))

-- OPTIONAL - display as popup in middle of screen
-- wilder.set_option('renderer', wilder.popupmenu_renderer(
--   wilder.popupmenu_palette_theme({
--     -- 'single', 'double', 'rounded' or 'solid'
--     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
--     border = 'rounded',
--     max_height = '75%',      -- max height of the palette
--     min_height = 0,          -- set to the same as 'max_height' for a fixed height window
--     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
--     reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
--   })
-- ))

