local cmp = require("cmp")

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup(
  {
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
      ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
      ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
      ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm(
        {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }
      ),
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
	if cmp.visible() and has_words_before() then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
	  fallback()
	end
      end),
      -- ["<Tab>"] = cmp.mapping.confirm(
      --   {
      --     behavior = cmp.ConfirmBehavior.Replace,
      --     select = true
      --   }
      -- )
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "buffer"},
      {name = "path"},
      {name = "spell"},
      {name = "vsnip"},
      { name = "copilot" }
    }
  }
)
