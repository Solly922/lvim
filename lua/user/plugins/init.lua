require "user.plugins.lualine"

lvim.plugins = {
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  --
  -- Github Copilot
  --
  {
    "github/copilot.nvim",
    config = function()
      require("user.plugins.copilot").config_vim()
    end,
  }
}
