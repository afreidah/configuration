-- Function to run the Git commit and push
local function git_commit_and_push()
    -- Run the Git commit
  local commit_message = vim.fn.input('Commit message: ')
  vim.cmd('G commit -Am ."' .. commit_message .. '"')

    -- Run the Git push
  local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD')
  branch = branch:gsub('\n', '')  -- Remove the trailing newline
  vim.cmd('G push origin ' .. branch)
end

-- Keybinding to run the Git commit and push
vim.api.nvim_set_keymap('n', '<Leader>gp', ':lua git_commit_and_push()<CR>', { noremap = true, silent = true })

