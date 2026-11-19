-- ~/.config/nvim/lua/plugins/snacks-explorer.lua
return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer({ cwd = vim.uv.cwd() })
      end,
      desc = "Explorer (cwd)",
    },
  },
}
