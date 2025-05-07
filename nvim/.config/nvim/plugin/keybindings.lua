-- Keybindings for Copilot
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<cr>', { desc = 'Open Copilot Chat' })
vim.keymap.set('n', '<leader>ct', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })

-- Keybindings for fzf (file search)
vim.keymap.set('n', '<leader>gg', ':GFiles?<CR>', { desc = 'Search for files', silent = true })
vim.keymap.set('n', '<leader>fg', ':GFiles<CR>', { desc = 'Search for files', silent = true })
vim.keymap.set('n', '<leader>fd', ':Files<CR>', { desc = 'Search for files', silent = true })
vim.keymap.set('n', '<leader>rg', ':Rg<CR>', { desc = 'Search with ripgrep', silent = true })
vim.keymap.set('n', '<leader>Rg', ':RG<CR>', { desc = 'Search with ripgrep (case insensitive)', silent = true })

-- Packer related commands
vim.keymap.set('n', '<Leader>ps', ':PackerStatus<CR>', { desc = 'Show Packer status', silent = true })
vim.keymap.set('n', '<Leader>pi', ':PackerSync<CR>', { desc = 'Sync Packer plugins', silent = true })

-- Buffer management
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { desc = 'Close buffer', silent = true })

-- Window management
vim.keymap.set('n', '<leader>fs', ':only<CR>', { desc = 'Maximize current window', silent = true })

-- Sorting lines
vim.keymap.set('x', '<Leader>s', ":!awk '{ print length($0) \" \" $0; }' | sort -n | cut -d ' ' -f 2-<CR>", { desc = 'Sort lines by length (short to long)', silent = true })

-- Miscellaneous
vim.keymap.set('n', '<leader>W', [[:%s/\s\+$//<cr>:let @/=''<CR>]], { desc = 'Remove trailing whitespace' })
vim.keymap.set('n', '<leader>a', ':Ack ', { desc = 'Trigger ack search' })

-- Split management
vim.keymap.set('n', '<leader>v', '<C-w>v<C-w>l', { desc = 'Split window vertically', silent = true })

-- Neogit layout opening
vim.keymap.set('n', '<leader>ng', ':Neogit kind=split<CR>', { desc = 'Open Neogit in split layout', silent = true })
vim.keymap.set('n', '<leader>nf', ':Neogit kind=floating<CR>', { desc = 'Open Neogit in floating layout', silent = true })
vim.keymap.set('n', '<leader>nv', ':Neogit kind=vsplit<CR>', { desc = 'Open Neogit in vertical split layout', silent = true })

-- Trouble plugin (for diagnostics and more)
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Toggle diagnostics in Trouble' })
vim.keymap.set('n', '<leader>T', ':Trouble diagnostics<CR>', { desc = 'Show diagnostics in Trouble' })

-- NerdTree toggle
vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>', { desc = 'Toggle NerdTree', silent = true })

-- Tagbar toggle
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { desc = 'Toggle Tagbar', silent = true })

-- Telescope mappings
vim.keymap.set('n', '<C-t>', ':Telescope file_browser<CR>', { desc = 'Open Telescope file browser', silent = true })
vim.keymap.set('n', '<C-g>', ':Telescope live_grep<CR>', { desc = 'Search with live grep in Telescope', silent = true })
vim.keymap.set('n', '<C-G>', ':Telescope grep_string<CR>', { desc = 'Search string with Telescope', silent = true })

-- Git gutter mappings
vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghu', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hp', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })

-- Go keybindings
vim.keymap.set('n', '<leader>gd', ':GoDoc<CR>', { desc = 'View GoDoc under cursor', silent = true })
vim.keymap.set('n', '<leader>gt', ':GoTestSum ./...<CR>', { desc = 'Run GoTestSum', buffer = true })
