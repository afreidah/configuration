-- General settings
vim.o.compatible = false
vim.o.modelines = 0
vim.o.autoindent = true
vim.o.syntax = 'on'
vim.o.laststatus = 2
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 2
vim.o.tabstop = 8
vim.o.shiftround = true
vim.o.cindent = true
vim.o.number = true
vim.o.cinkeys = vim.o.cinkeys .. '-0#'
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.o.foldenable = false  -- Disable folding
vim.o.list = false
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 3
vim.o.showmode = true
vim.o.showcmd = true
vim.o.hidden = true
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'
vim.o.visualbell = true
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.ruler = true
vim.o.backspace = 'indent,eol,start'
vim.o.undofile = true
vim.api.nvim_set_keymap('n', '/', '/\\v', { noremap = true })
vim.api.nvim_set_keymap('v', '/', '/\\v', { noremap = true })
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.wrapmargin = 70
vim.o.termguicolors = true
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })
vim.o.listchars = 'tab:▸\\ ,eol:¬'
vim.cmd([[autocmd FocusLost * :wa]])
vim.cmd([[filetype plugin indent on]])

-- open neogit in different layouts
vim.api.nvim_set_keymap('n', '<leader>ng', ':Neogit kind=split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nf', ':Neogit kind=floating<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nv', ':Neogit kind=vsplit<CR>', { noremap = true, silent = true })

-- Remove trailing whitespace
vim.api.nvim_set_keymap('n', '<leader>W', [[:%s/\s\+$//<cr>:let @/=''<CR>]], { noremap = true })
-- Trigger ack
vim.api.nvim_set_keymap('n', '<leader>a', ':Ack ', { noremap = true })
-- Split handling
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v<C-w>l', { noremap = true })

-- Make tabs, trailing whitespace, and non-breaking spaces visible
--vim.o.listchars = 'tab:\\uBB\\uBB,trail:\\uB7,nbsp:~'

-- pane navigation
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Airline settings
vim.g.airline_theme = 'deus'

-- Terminal settings
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])
vim.api.nvim_set_keymap('n', '<C-t>', ':split | term<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-T>', ':vsplit | term<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-S-n>', '<C-\\><C-N><C-w>l', { noremap = true })

-- shortcuts for PackerSync and PackerStatus
vim.api.nvim_set_keymap('n', '<Leader>ps',':PackerStatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>pi',':PackerSync<CR>', { noremap = true, silent = true })

-- close buffer and return to last
vim.api.nvim_set_keymap('n', '<Leader>d',':bd<CR>', { noremap = true, silent = true })

-- Keybinding to maximize the current window (pane)
vim.api.nvim_set_keymap('n', '<leader>fs', ':only<CR>', { noremap = true, silent = true })

-- sort lines by length short to long
-- Map <Leader>r to replace 'old' with 'new' in the selected text (visual mode)
vim.api.nvim_set_keymap('x', '<Leader>s', ":!awk '{ print length($0) \" \" $0; }' | sort -n | cut -d ' ' -f 2-<CR>", { noremap = true, silent = true })
