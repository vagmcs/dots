return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  keys = {
    -- disable the keymap
    { "<leader>e", false },
    { "<leader>E", false },
  },
}
