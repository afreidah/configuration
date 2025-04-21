local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),         -- Show completion menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept suggestion with Enter
    ['<Tab>'] = cmp.mapping.select_next_item(),     -- Next item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),   -- Previous item
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
