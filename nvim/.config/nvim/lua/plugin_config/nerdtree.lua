-- then in your init.lua or a setup file:
vim.g.webdevicons_enable = true
vim.g.webdevicons_conceal_nerdtree_brackets = true
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.NERDTreeShowBookmarks = 1

--
-- Define a table of colors
local colors = {
  brown        = "#905532",
  aqua         = "#3AFFDB",
  blue         = "#689FB6",
  darkBlue     = "#44788E",
  purple       = "#834F79",
  lightPurple  = "#834F79",
  red          = "#AE403F",
  beige        = "#F5C06F",
  yellow       = "#F09F17",
  orange       = "#D4843E",
  darkOrange   = "#F16529",
  pink         = "#CB6F6F",
  salmon       = "#EE6E73",
  green        = "#8FAA54",
  lightGreen   = "#31B53E",
  white        = "#FFFFFF",
  rspec_red    = "#FE405F",
  git_orange   = "#F54D27",
}

vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  ['Modified']  = '✹',
  ['Staged']    = '✚',
  ['Untracked'] = '✭',
  ['Renamed']   = '➜',
  ['Unmerged']  = '═',
  ['Deleted']   = '✖',
  ['Dirty']     = '✗',
  ['Ignored']   = '☒',
  ['Clean']     = '✔︎',
  ['Unknown']   = '?',
}

-- NERDTree extension highlight colors
vim.g.NERDTreeExtensionHighlightColor = {
  css = colors.blue,
}

-- NERDTree exact‑match highlight colors
vim.g.NERDTreeExactMatchHighlightColor = {
  [".gitignore"] = colors.git_orange,
}

-- NERDTree pattern‑match highlight colors
vim.g.NERDTreePatternMatchHighlightColor = {
  [".*_spec%.rb$"] = colors.rspec_red,
}

-- WebDevIcons default symbols
vim.g.WebDevIconsDefaultFolderSymbolColor = colors.beige
vim.g.WebDevIconsDefaultFileSymbolColor   = colors.blue
