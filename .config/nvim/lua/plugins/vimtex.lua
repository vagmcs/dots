return {
  "lervag/vimtex",
  keys = {
    { "<leader>cc", "<cmd>VimtexCompile<cr>", desc = "Toggle compilation", ft = "tex" },
    { "<leader>cv", "<cmd>VimtexView<cr>", desc = "View PDF", ft = "tex" },
    { "<leader>ce", "<cmd>VimtexErrors<cr>", desc = "Show errors", ft = "tex" },
    { "<leader>ck", "<cmd>VimtexClean<cr>", desc = "Clean files", ft = "tex" },
  },
  config = function()
    vim.g.tex_flavor = "latex"
    -- Disable default vimtex keymaps
    vim.g.vimtex_mappings_enabled = 0
    -- Enable continuous compilation
    vim.g.vimtex_compiler_latexmk = {
      continuous = 1,
      options = {
        "-pdf",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
}
