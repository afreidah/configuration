
require('telescope').setup {
  extensions = {
    file_browser = {
      -- Optional configuration for the file browser
    },
  },
}

-- Load the extension
require('telescope').load_extension('file_browser')
