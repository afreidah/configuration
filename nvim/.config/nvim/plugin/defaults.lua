-- General settings
vim.opt.compatible = false
--vim.o.compatible = false
vim.o.tags = "./.tags;,.tags;"
vim.g.tpipeline_autoembed = 0
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
vim.api.nvim_set_hl(0, "Comment", { link = "Normal" })
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Tab>', '%', { noremap = true })
vim.api.nvim_set_keymap('v', '<Tab>', '%', { noremap = true })
vim.o.listchars = 'tab:▸\\ ,eol:¬'
vim.cmd([[autocmd FocusLost * :wa]])
vim.cmd([[filetype plugin indent on]])

-- pane navigation
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- Make tabs, trailing whitespace, and non-breaking spaces visible
--vim.o.listchars = 'tab:\\uBB\\uBB,trail:\\uB7,nbsp:~'

