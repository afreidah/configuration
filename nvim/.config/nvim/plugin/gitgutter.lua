-- GitGutter settings
vim.o.updatetime = 100
vim.g.gitgutter_signs = 1
vim.g.gitgutter_highlight_linenrs = 1
vim.g.gitgutter_preview_win_floating = 1
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_show_msg_on_hunk_jumping = 1
vim.cmd('highlight GitGutterAddLineNr guifg=lightgreen')
vim.cmd('highlight GitGutterChangeLineNr guifg=lightblue')
vim.cmd('highlight GitGutterDeleteLineNr guifg=lightred')
vim.cmd('highlight GitGutterChangeDeleteLineNr guifg=lightred')

vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)', { noremap = true, silent = true })
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true })
vim.keymap.set('n', 'ghu', '<Plug>(GitGutterStageHunk)', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hp', '<Plug>(GitGutterPreviewHunk)', { noremap = true, silent = true })

