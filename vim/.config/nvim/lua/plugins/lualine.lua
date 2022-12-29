require('lualine').setup {
  options = {
    theme = 'gruvbox_dark',
    disabled_filetypes = { 'packer', 'NvimTree' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'filetype'},
    -- lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
