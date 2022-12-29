local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- disable annoying stuff
o.errorbells = false

-- disable backup and swp files
bo.swapfile = false
o.backup = false

require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false   -- Non focused panes set to alternative background
  }
})

vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme duskfox]])
vim.cmd([[colorscheme gruvbox]])

-- line numbers
wo.number = true
wo.relativenumber = true
o.scrolloff = 8

-- display
o.completeopt = "menu,menuone,noselect"
wo.wrap = true
wo.signcolumn = "no"
vim.cmd("highlight clear SignColumn")
vim.cmd("highlight clear Folded")
vim.cmd("highlight VertSplit cterm=NONE gui=NONE")
vim.cmd("highlight Pmenu ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey")
vim.cmd("highlight PmenuSel ctermbg=Grey guibg=Grey ctermfg=Black guifg=Black")
vim.cmd("highlight PmenuSbar ctermbg=Black guibg=Black")
vim.cmd("highlight PmenuThumb ctermbg=Grey guibg=Grey")
vim.cmd("highlight LspDiagnosticsFloating ctermbg=Black guibg=Black")
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded"
  }
)

-- searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- interface
o.ls = 0
o.ch = 0
o.showmatch = true
wo.cursorline = true
wo.list = true
-- vim.cmd('set listchars=tab:‹·›,trail:·,lead:·,precedes:«,extends:»')
vim.cmd("highlight SpecialKey ctermfg=DarkGrey guifg=DarkGrey")
vim.cmd("highlight NonText ctermfg=DarkGrey guifg=DarkGrey")

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
vim.cmd("highlight LspDiagnosticsVirtualTextError ctermfg=Red guifg=Red")
vim.cmd("highlight LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=Yellow")
vim.cmd("highlight LspDiagnosticsVirtualTextHint ctermfg=Blue guifg=Blue")
vim.cmd("highlight LspDiagnosticsVirtualTextInformation ctermfg=DarkGrey guifg=DarkGrey")
vim.cmd("highlight LspDiagnosticsUnderlineError ctermfg=none guifg=none cterm=underline gui=underline")
vim.cmd("highlight LspDiagnosticsUnderlineWarning ctermfg=none guifg=none cterm=underline gui=underline")
vim.cmd("highlight LspDiagnosticsUnderlineInformation ctermfg=none guifg=none cterm=underline gui=underline")
vim.cmd("highlight LspDiagnosticsUnderlineHint ctermfg=none guifg=none cterm=underline gui=underline")

-- vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(0,{scope = "cursor"})]])
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, } )

vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)")
-- vim.cmd('autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 200)')

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufNewFile,BufRead *.hcl set filetype=terraform syntax=terraform
      autocmd BufWritePre *.hcl FormatWrite
      autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()
      autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
    augroup END
  ]],
  true
)
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.cmd("set noswapfile")

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- UNCOMMENT FOR DEBUG MESSAGES
-- print('- options.lua...OK!')
