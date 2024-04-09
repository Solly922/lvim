-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local user_utils = require "user.utils"

local config_file_names_eslint = require("user.languages.config-file-names").eslint
local config_file_names_prettier = require("user.languages.config-file-names").prettier

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup({
  formatting.eslint_d.with {
    condition = function(nls_utils)
      return nls_utils.root_has_file(config_file_names_eslint) or user_utils.is_in_package_json "eslint"
    end,
  },
  formatting.prettierd,
  formatting.goimports,
  formatting.gofumpt,
})
