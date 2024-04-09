-- Which-key: AI (Copilot, ...)
lvim.builtin.which_key.mappings["a"] = {
  name = "+A.I. (Copilot)",
  s = { "<cmd>Copilot suggestion<cr>", "Copilot: toggle suggestions " },
  p = { "<cmd>Copilot panel<cr>", "Copilot: toggle panel" },
  c = { "<cmd>Copilot toggle<cr>", "Copilot: toggle" },
  S = { "<cmd>Copilot status<cr>", "Copilot: Status" },
  v = { "<cmd>Copilot version<cr>", "Copilot: version" },
}

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
