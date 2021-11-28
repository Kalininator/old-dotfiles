require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "npx eslint",
            args = {"--stdin-filename", vim.api.nvim_buf_get_name(0), '--fix'},
            stdin = true
          }
        end
    },
    typescript = {
        -- prettier
       function()
          return {
            exe = "eslint_d",
            args = {"--fix-to-stdout", "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), '--fix'},
            stdin = true
          }
        end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    -- lua = {
    --     -- luafmt
    --     function()
    --       return {
    --         exe = "luafmt",
    --         args = {"--indent-count", 2, "--stdin"},
    --         stdin = true
    --       }
    --     end
    -- },
  }
})

-- UNCOMMENT FOR DEBUG MESSAGES
-- print('- plugins/formatter-config.lua...OK!')
