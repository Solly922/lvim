-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.automatic_servers_installation = false
lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "jsonls",
  "pyright",
  "lua_ls",
  "tsserver",
  "bicep",
  "gopls",
  "golangci_lint_ls",
  "golangci-lint",
}

-- Setup lsp-overloads if plugin is installed
lvim.lsp.on_attach_callback = function(client, _)
  if client.server_capabilities.signatureHelpProvider then
    local status_ok, lsp_overloads = pcall(require, "lsp-overloads")
    if status_ok then
      -- https://github.com/Issafalcon/lsp-overloads.nvim#configuration
      lsp_overloads.setup(client, {
        -- Defaults
        keymaps = {
          next_signature = "<C-j>",
          previous_signature = "<C-k>",
          next_parameter = "<C-l>",
          previous_parameter = "<C-h>",
        },
      })
    end
  end
end
