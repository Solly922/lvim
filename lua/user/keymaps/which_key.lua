local restartActiveLsp = function()
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name ~= "copilot" and client.name ~= "null-ls" then
      vim.schedule(function()
        local name = client.name
        local cmd = "LspRestart " .. client.id
        vim.cmd(cmd)
        print(cmd .. " (" .. name .. ") - completed.")
      end)
    end
  end
end

lvim.builtin.which_key.mappings["lR"] = { restartActiveLsp, "Restart LSPs" }
