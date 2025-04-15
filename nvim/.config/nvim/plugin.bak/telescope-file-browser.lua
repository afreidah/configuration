-- telescope options
require('telescope').load_extension('terraform')
local builtin = require('telescope.builtin')
vim.api.nvim_set_keymap('n', '<C-t>', ':Telescope file_browser<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-G>', ':Telescope grep_string<CR>', { noremap = true, silent = true })
