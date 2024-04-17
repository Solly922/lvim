require "user.plugins.lualine"

lvim.plugins = {
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  --
  -- Github Copilot
  --
  {
    "github/copilot.vim",
    config = function()
      require("user.plugins.copilot").config_vim()
    end,
  },
  --
  -- Autotag
  --
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }
}
