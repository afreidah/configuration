-- Linter configuration
vim.g.ale_linters = {
  javascript = { 'eslint' },
  ruby = { 'rubocop' },
}

-- Only use the explicitly set linters
vim.g.ale_linters_explicit = 1

-- Use the binstub version of rubocop
--vim.g.ale_ruby_rubocop_executable = 'bin/rubocop'

-- Use bullet characters for signs
vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'

-- Always show the sign column
vim.g.ale_sign_column_always = 1

