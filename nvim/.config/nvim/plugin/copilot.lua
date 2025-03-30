-- Copilot settings
vim.g.copilot_filetypes = {
    gitcommit = true,
    markdown = true,
    yaml = true,
    python = true,
    go = true,
    ruby = true
}
vim.g.copilot_chat_disable_separators = "no"
vim.g.copilot_enabled = 1
vim.g.copilot_chat_proxy = ""
vim.g.copilot_chat_enabled = 1
vim.g.copilot_chat_show_help = 'yes'
vim.g.copilot_chat_disable_separators = 'no'
vim.g.copilot_chat_hide_system_prompt = 'yes'
vim.api.nvim_set_keymap('i', '<silent><expr> <Tab>', 'copilot#Accept("<CR>")', { noremap = true })
--vim.api.nvim_set_keymap('i', '<C-Space>', '<Plug>(copilot-suggest)', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChatOpen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ct', ':CopilotChatToggle<CR>', { noremap = true })
-- Set up the keymap for chat, ensuring it uses the workspace context
--vim.api.nvim_set_keymap('n', '<leader>ce', ':CopilotChatExplain<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ce', ':CopilotChatExplain @workspace<CR>', { noremap = true, silent = true })


require('CopilotChat').setup()
