return {
  "wintermute-cell/gitignore.nvim",
  keys = {
    { "<leader>gt", "<cmd>Gitignore<cr>", desc = "Generate ignore rules" },
  },
  config = function()
    require("gitignore")
  end,
}
