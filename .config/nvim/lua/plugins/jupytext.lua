return {
  {
    "goerz/jupytext.nvim",
    config = function()
      local jupytext = require("jupytext")
      jupytext.setup({
        jupytext = "jupytext",
        format = "py:percent",
        update = true,
        filetype = jupytext.get_filetype,
        new_template = jupytext.default_new_template(),
        sync_patterns = { "*.md", "*.py", "*.jl", "*.R", "*.Rmd", "*.qmd" },
        autosync = true,
        handle_url_schemes = true,
      })
    end,
  },
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "ipython", "--no-autoindent", "--no-banner" },
              format = require("iron.fts.common").bracketed_paste,
            },
          },
          repl_open_cmd = require("iron.view").split.vertical.botright(80),
        },
        keymaps = {
          send_motion = "<leader>rc",
          visual_send = "<leader>r",
          send_line = "<leader>rl",
          cr = "<leader>r<cr>",
          interrupt = "<leader>ri",
          exit = "<leader>rq",
          clear = "<leader>rx",
        },
      })

      local function send_cell_to_repl()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local bufnr = vim.api.nvim_get_current_buf()

        local cell_start = 1
        for i = current_line, 1, -1 do
          local line = vim.fn.getline(i)
          if line:match("^# %%%%") then
            cell_start = i + 1
            break
          end
        end

        local cell_end = total_lines
        for i = current_line + 1, total_lines do
          local line = vim.fn.getline(i)
          if line:match("^# %%%%") then
            cell_end = i - 1
            break
          end
        end

        while cell_start <= cell_end and vim.fn.getline(cell_start):match("^%s*$") do
          cell_start = cell_start + 1
        end

        while cell_end >= cell_start and vim.fn.getline(cell_end):match("^%s*$") do
          cell_end = cell_end - 1
        end

        if cell_start <= cell_end then
          local lines = vim.api.nvim_buf_get_lines(bufnr, cell_start - 1, cell_end, false)
          require("iron.core").send(nil, lines)
        end
      end

      vim.api.nvim_create_user_command("IronSendCell", send_cell_to_repl, {})
      vim.keymap.set("n", "<leader>rp", send_cell_to_repl, { desc = "Send cell to REPL" })
    end,
    keys = {
      { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Toggle REPL" },
      { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
      { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL" },
      { "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide REPL" },
    },
  },
}
