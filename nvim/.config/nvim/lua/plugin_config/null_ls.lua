local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- rubocop for both diagnostics & safe auto-correct
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop.with({
      extra_args = { "--auto-correct" },
    }),
    -- rufo is a fast Ruby formatter (optional)
    null_ls.builtins.formatting.rufo,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "LspFormatting" })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", {}),
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
      })
    end
  end,
})

