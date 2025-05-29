-- Copilot Chat Configuration
require("CopilotChat").setup({
  build = "make tiktoken",  -- Optional step for specific builds (required for some environments)
  window = {
    layout = "float",          -- "float" makes it a floating window
    width = 160,               -- width of the chat window
    height = 60,               -- height of the chat window
    border = "rounded",        -- border style
  },
})
