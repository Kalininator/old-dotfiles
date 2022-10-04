require('lualine').setup {
  options = {
    theme = 'palenight',
    disabled_filetypes = { 'packer', 'NvimTree' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    -- lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
