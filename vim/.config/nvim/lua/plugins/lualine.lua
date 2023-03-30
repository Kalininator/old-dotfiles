local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

require('lualine').setup {
  options = {
    theme = 'gruvbox_dark',
    disabled_filetypes = { 'packer', 'NvimTree' }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
	{
	    "macro-recording",
	    fmt = show_macro_recording,
	},
    },
    lualine_c = { 'diff', 'diagnostics'},
    lualine_d = {{'filename', path = 1}},
    lualine_x = {'filetype'},
    -- lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
