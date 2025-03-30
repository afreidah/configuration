-- <Plug>ToggleProjectWorkbench lets you toggle project-specific workbench
vim.api.nvim_set_keymap('n', '<leader>wp', '<Plug>ToggleProjectWorkbench', { noremap = true, silent = true })

-- <Plug>ToggleBranchWorkbench lets you toggle the branch-specific workbench
vim.api.nvim_set_keymap('n', '<leader>wb', '<Plug>ToggleBranchWorkbench', { noremap = true, silent = true })

-- <Plug>WorkbenchToggleCheckbox allows you to add/toggle the checkbox
-- - testing -> - [ ] testing
-- - [ ] testing -> - [x] testing
-- - [x] testing -> - [ ] testing
vim.api.nvim_set_keymap('n', '<leader><CR>', '<Plug>WorkbenchToggleCheckbox', { noremap = true, silent = true })

