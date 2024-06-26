-- Which-key: AI (Copilot, ...)
lvim.builtin.which_key.mappings["a"] = {
  name = "+A.I. (Copilot)",
  e = { "<cmd>Copilot enable<cr>", "Copilot: enable" },
  d = { "<cmd>Copilot disable<cr>", "Copilot: disable" },
  p = { "<cmd>Copilot panel<cr>", "Copilot: toggle panel" },
  S = { "<cmd>Copilot status<cr>", "Copilot: Status" },
  v = { "<cmd>Copilot version<cr>", "Copilot: version" },
}

-- Add to Which-key: T (Treesitter, ...)
lvim.builtin.which_key.mappings['Tc'] = { "<cmd>TSContextToggle<cr>", "Toggle Treesitter Context" }

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
