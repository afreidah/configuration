vim.api.nvim_set_keymap('n', '<Leader>k', ':Dasht<Space>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader><Leader>k', ':Dasht!<Space>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>K', ':lua require("dasht").cursor_search_terms()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>K', ':lua require("dasht").cursor_search_terms("!")<CR>', { noremap = true, silent = true })

