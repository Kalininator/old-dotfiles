require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {
        function()
          return {
            exe = "eslint_d",
            args = {"--fix-to-stdout", "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix"},
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = "eslint_d",
            args = {"--fix-to-stdout", "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix"},
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = "eslint_d",
            args = {"--fix-to-stdout", "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix"},
            stdin = true
          }
        end
      },
      typescript = {
        function()
          return {
            exe = "eslint_d",
            args = {"--fix-to-stdout", "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix"},
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
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      ruby = {
       -- rubocop
       function()
         return {
           exe = "rubocop", -- might prepend `bundle exec `
           args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', "awk 'f; /^====================$/{f=1}'"},
           stdin = true,
         }
       end
     },
     terraform = {
      function()
        return {
          exec = "terragrunt",
          args = {"hclfmt"},
          stdin = false
        }
      end
    }
    }
  }
)

-- UNCOMMENT FOR DEBUG MESSAGES
-- print('- plugins/formatter-config.lua...OK!')
