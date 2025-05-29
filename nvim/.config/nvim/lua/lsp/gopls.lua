---- gopls LSP configuration with full auto-features
local lspconfig = require("lspconfig")

-- 1) Setup capabilities for nvim-cmp (if using completion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- 2) on_attach function to enable LSP features when gopls attaches
local on_attach = function(client, bufnr)
  local buf_map = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap=true, silent=true })
  end

  -- Go-to and navigation
  buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_map('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
  buf_map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  buf_map('n', 'K',  '<Cmd>lua vim.lsp.buf.hover()<CR>')

  -- Rename and code actions
  buf_map('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
  buf_map('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')

  -- Signature help in insert mode
  buf_map('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')

  -- Workspace and document symbols
  buf_map('n', '<leader>ws', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  buf_map('n', '<leader>ds', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>')

  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ timeout_ms = 2000 }) end,
    })
  end

  -- Organize imports on save
  if client.server_capabilities.codeActionProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { 'source.organizeImports' } },
          apply = true,
        })
      end,
    })
  end

  -- CodeLens: refresh and run
  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
      buffer = bufnr,
      callback = vim.lsp.codelens.refresh,
    })
    buf_map('n', '<leader>cl', '<Cmd>lua vim.lsp.codelens.run()<CR>')
  end

    -- Inlay hints (safe for all nvim/plugin versions)
  if client.server_capabilities.inlayHintProvider and vim.lsp.buf.inlay_hint then
    vim.lsp.buf.inlay_hint(bufnr, true)
  end
end

-- 3) gopls setup with desired settings
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams   = true,
        nilness        = true,
        unusedwrite    = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes    = true,
        compositeLiteralFields = true,
        compositeLiteralTypes  = true,
        constantValues         = true,
        functionTypeParameters = true,
        parameterNames         = true,
        rangeVariableTypes     = true,
      },
      codelenses = {
        generate           = true,
        gc_details         = true,
        regenerate_cgo     = true,
        tidy               = true,
        upgrade_dependency = true,
      },
    },
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
