vim.diagnostic.config({
  virtual_text = true,      -- inline error text at end of line
  signs = true,             -- signs in the gutter
  underline = true,
  update_in_insert = false, -- only update when you leave insert mode
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
})
