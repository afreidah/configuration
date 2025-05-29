-- lua/lsp_and_completion.lua

-- 1) neoconf for per-project JSON settings
require("neoconf").setup({
  local_settings  = ".neoconf.json",
  global_settings = "neoconf.json",
  import = { vscode = true, coc = true, nlsp = true },
  live_reload      = true,
  filetype_jsonc   = true,
  plugins = {
    lspconfig = { enabled = true },
    jsonls    = { enabled = true, configured_servers_only = true },
    lua_ls    = { enabled_for_neovim_config = true, enabled = false },
  },
})

-- 2) Shared capabilities & a stub on_attach
local capabilities     = require('cmp_nvim_lsp').default_capabilities()
local common_on_attach = function(client, bufnr)
  -- keymaps are set via LspAttach autocmd below
end

-- 2.1) Ruby-LSP compatibility shim
-- makes Neovim understand Ruby LSP diagnostics protocol
--

-- disabling because it might be the cause of slowness
require("ruby-lsp").setup()

-- 3) Server setups
local lspconfig = require('lspconfig')

-- Terraform / HCL (+ Nomad)
lspconfig.terraformls.setup {
  on_attach    = common_on_attach,
  capabilities = capabilities,
  filetypes    = { "terraform", "hcl", "tf", "nomad" },
}

-- Python
lspconfig.pyright.setup {
  on_attach    = common_on_attach,
  capabilities = capabilities,
}

-- TypeScript / JavaScript
lspconfig.ts_ls.setup {
  on_attach    = common_on_attach,
  capabilities = capabilities,
  filetypes    = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
}

-- Ruby via official Ruby LSP
-- disabling because it might be the cause of slowness
lspconfig.ruby_lsp.setup {
  on_attach    = common_on_attach,
  capabilities = capabilities,
  filetypes    = { "ruby", "erb", "rbs" },
}

-- Other generic servers
for _, srv in ipairs({ "clangd", "tflint", "yamlls", "pylsp" }) do
  lspconfig[srv].setup {
    on_attach    = common_on_attach,
    capabilities = capabilities,
  }
end

-- 4) LSP keymaps via autocmd (fires on every attach)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    local map = vim.keymap.set
    map('n', 'K',  vim.lsp.buf.hover,          opts)
    map('n', 'gd', vim.lsp.buf.definition,     opts)
    map('n', 'gD', vim.lsp.buf.declaration,    opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'go', vim.lsp.buf.type_definition,opts)
    map('n', 'gr', vim.lsp.buf.references,     opts)
    map('n', 'gs', vim.lsp.buf.signature_help, opts)
    map('n', '<F2>',       vim.lsp.buf.rename,       opts)
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format { async = true } end, opts)
    map('n', '<F4>',       vim.lsp.buf.code_action,  opts)
  end,
})

-- 5) LuaSnip ↔ keybindings
local ls = require('luasnip')
vim.keymap.set({ 'i','s' }, '<Tab>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<Tab>', true, true, true),
      'n',
      true
    )
  end
end, { silent = true })

vim.keymap.set({ 'i','s' }, '<S-Tab>', function()
  if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true })

vim.keymap.set({ 'i','s' }, '<C-E>', function()
  if ls.choice_active() then ls.change_choice(1) end
end, { silent = true })

-- 6) nvim-cmp setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
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

-- 7) Treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "c","go","ruby","lua","vim","vimdoc","query","markdown","markdown_inline",
  },
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_,buf)
      local max = 100 * 1024
      local ok, st = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and st and st.size > max
    end,
    additional_vim_regex_highlighting = false,
  },
})
vim.opt.signcolumn = 'yes'

-- 8) Trouble (optional)
pcall(function() require("trouble").setup({}) end)

-- 9) Copilot-CMP (optional)
pcall(function() require("copilot_cmp").setup() end)

-- 10) Wilder for cmdline
local wilder = require('wilder')
wilder.setup({ modes = {':','/','?'} })
wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({ highlighter = wilder.basic_highlighter() }),
  ['/'] = wilder.wildmenu_renderer({ highlighter = wilder.basic_highlighter() }),
}))

-- 11) gopls stays in its own file
require("lsp.gopls")


