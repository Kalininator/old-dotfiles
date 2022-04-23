local lspconfig = require("lspconfig")
local util = require("lspconfig").util

-- languages: HTML/CSS/JSON
-- requirements: 'npm', 'vscode-langservers-extracted'
-- command: npm i -g vscode-langservers-extracted
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.jsonls.setup {}
lspconfig.solargraph.setup {}
-- lspconfig.ansiblels.setup {}

-- language: JavaScript/TypeScript
-- requirements: 'npm', 'typescript', 'typescript-language-server'
-- command: npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {}

lspconfig.diagnosticls.setup {
  filetypes = {"javascript", "typescript"},
  root_dir = function(fname)
    return util.root_pattern("tsconfig.json")(fname) or util.root_pattern(".eslintrc.js")(fname)
  end,
  init_options = {
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".eslintrc.js", ".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    },
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint"
    }
  }
}

local on_attach = function(client)
  require "completion".on_attach(client)
end

lspconfig.rust_analyzer.setup(
  {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = {
            "unresolved-proc-macro"
          },
          enableExperimental = true,
          enable = true
        },
        assist = {
          importGranularity = "module",
          importPrefix = "by_self"
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
        checkOnSave = {
          command = "clippy"
        }
      }
    }
  }
)
