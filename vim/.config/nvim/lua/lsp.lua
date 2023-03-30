local lspconfig = require("lspconfig")
local util = require("lspconfig").util
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- languages: HTML/CSS/JSON
-- requirements: 'npm', 'vscode-langservers-extracted'
-- command: npm i -g vscode-langservers-extracted
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.jsonls.setup {}
lspconfig.solargraph.setup {
  on_attach = on_attach
}
lspconfig.tailwindcss.setup {}
-- lspconfig.ansiblels.setup {}

-- language: JavaScript/TypeScript
-- requirements: 'npm', 'typescript', 'typescript-language-server'
-- command: npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {
  on_attach = on_attach
}
lspconfig.terraformls.setup {
  on_attach = on_attach,
  filetypes = {"terraform", "hcl"}
}

lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
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
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint"
    }
  }
}

lspconfig.rust_analyzer.setup  {
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

