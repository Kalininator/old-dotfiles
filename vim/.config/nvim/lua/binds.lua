local binds = {
  {"i", "kj", "<Esc>"},
  -- FILES = `f`
  {'n', '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<CR>'}, -- open file finder
  -- {"n", "<leader>f", '<cmd>lua require("telescope.builtin").git_files()<CR>'}, -- open git file finder
  -- {'n', '<leader>fb', '<cmd>lua require("telescope.builtin").file_browser()<CR>'}, -- open file browser on current working directory
  -- {'n', '<leader>fd', '<cmd>lua require("telescope.builtin").file_browser({ cwd = require("telescope.utils").buffer_dir() })<CR>'}, -- open file browser on buffer directory
  -- {'n', '<Leader>a', '<cmd>lua require("plugins.telescope-config").live_grep()<CR>'}, -- open fuzzy find accross current working directory

  -- FUZZY SEARCHING = `/`
  {"n", "<Leader>a", '<cmd>lua require("plugins.telescope-config").live_grep()<CR>'}, -- open fuzzy find accross current working directory
  {"n", "<Leader>l", '<cmd>lua require("plugins.telescope-config").current_buffer_fuzzy_find()<CR>'}, -- open fuzzy find within current buffer
  -- LANGUAGE SERVER PROTOCOL = `s`
  -- {'n', '<silent> K', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>'}, -- show diagnostics
  {"n", "<Leader>gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>'}, -- go to definition
  -- {'n', '<Leader>st', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>'}, -- go to type definition
  -- {'n', '<Leader>si', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>'}, -- go to implementation
  {"n", "<Leader>gu", '<cmd>lua require("telescope.builtin").lsp_references()<CR>'}, -- show references
  {"n", "<Leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<CR>'}, -- show references
  {"n", "<Leader>gs", '<cmd>lua require("telescope.builtin").git_status()<CR>'}, -- show references
  {"n", "<Leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<CR>'}, -- show references
  {"n", "<Leader>gt", '<cmd>lua require("telescope.builtin").treesitter()<CR>'}, -- show references
  {"n", "<leader>ac", '<cmd>lua vim.lsp.buf.code_action()<CR>'}, -- show code actions
  -- {'n', 'K', '<cmd>lua vim.diagnostic.open_float()<CR>'}, -- cursor hover
  {"n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>"}, -- cursor hover
  {"n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>"}, -- rename symbol
  -- {'n', '<leader>sj', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'}, -- go to next diagnostic
  -- {'n', '<leader>sk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'}, -- go to previous diagnostic
  {"n", "<C-n>", ":NvimTreeToggle<CR>"},
  -- Tux navigation
  {"n", "<C-h>", '<cmd>lua require"nvim-tmux-navigation".NvimTmuxNavigateLeft()<CR>'},
  {"n", "<C-j>", '<cmd>lua require"nvim-tmux-navigation".NvimTmuxNavigateDown()<CR>'},
  {"n", "<C-k>", '<cmd>lua require"nvim-tmux-navigation".NvimTmuxNavigateUp()<CR>'},
  {"n", "<C-l>", '<cmd>lua require"nvim-tmux-navigation".NvimTmuxNavigateRight()<CR>'},
  -- {"n", "<leader>C", '<cmd>lua require"nvim-docker".containers.list_containers()<CR>'},
  {"n", "<leader>d", "<cmd>Format<CR>"},
  {"x", "<leader>p", "\"_dP"}
}

vim.g.mapleader = " "

local opts = {noremap = true, silent = true}

for i = 1, #binds do
  local mode = binds[i][1]
  local lhs = binds[i][2]
  local rhs = binds[i][3]

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
