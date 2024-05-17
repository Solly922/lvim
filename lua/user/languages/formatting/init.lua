-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local user_utils = require "user.utils"

local config_file_names_eslint = require("user.languages.config-file-names").eslint
local config_file_names_prettier = require("user.languages.config-file-names").prettier

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

linters.setup({
  {
    name = "eslint_d"
  }
})

formatters.setup({
  -- formatting.eslint_d,
  formatting.prettier.with {
    condition = function(nls_utils)
      return nls_utils.root_has_file(config_file_names_prettier) or user_utils.is_in_package_json("prettier")
    end
  },
  {
    name = "prettierd",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = {
      "--single-attribute-per-line",
      "--trailing-comma=es5",
      "--print-width=80",
    },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    -- filetypes = { "typescript", "typescriptreact" },
  },
  formatting.goimports,
  formatting.gofumpt,
})
