local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- disable annoying stuff
o.errorbells = false

-- disable backup and swp files
bo.swapfile = false
o.backup = false

vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- line numbers
wo.number = true
o.scrolloff = 8

-- display
o.completeopt = 'menu,menuone,noselect'
wo.wrap = false
wo.signcolumn = 'yes'
vim.cmd('highlight clear SignColumn')
vim.cmd('highlight clear Folded')
vim.cmd('highlight VertSplit cterm=NONE gui=NONE')
vim.cmd('highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey')
vim.cmd('highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black')
vim.cmd('highlight PmenuSbar ctermbg=Black guibg=Black')
vim.cmd('highlight PmenuThumb ctermbg=Grey guibg=Grey')
vim.cmd('highlight LspDiagnosticsFloating ctermbg=Black guibg=Black')
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded"
  }
)

-- searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- interface
o.showmatch = true
wo.cursorline = true
wo.list = true
-- vim.cmd('set listchars=tab:‹·›,trail:·,lead:·,precedes:«,extends:»')
vim.cmd('highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey')
vim.cmd('highlight NonText ctermfg=DarkGrey guifg=DarkGrey')

-- split behaviour
o.splitbelow = true
o.splitright = true

-- indentation behaviour
bo.expandtab = false
bo.smartindent = true
bo.softtabstop = 0
bo.tabstop = 2
o.shiftwidth = 2
-- wo.foldmethod = 'indent'
-- o.foldlevel = 2

-- lsp
vim.cmd('highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red')
vim.cmd('highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow')
vim.cmd('highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue')
vim.cmd('highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey')
vim.cmd('highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline')
vim.cmd('highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline')
vim.cmd('highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline')
vim.cmd('highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline')

vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)')
-- vim.cmd('autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 200)')

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.rs,*.lua FormatWrite
augroup END
]], true)




-- UNCOMMENT FOR DEBUG MESSAGES
-- print('- options.lua...OK!')
