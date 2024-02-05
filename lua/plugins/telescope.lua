return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      local wk = require("which-key")
      wk.register({
        f = {
          name = "Telescope",
          -- FILES
          f = { builtin.find_files, "Find Files" },
          o = { builtin.oldfiles, "Old Files" },
          g = { builtin.live_grep, "Grep String" },
          u = { "<CMD>Telescope undo<CR>", "Undo History" },
          t = { "<CMD>TodoTelescope keywords=TODO,FIX<CR>", "TODO / FIX Comments" },

          -- NEOVIM
          ["?"] = { builtin.help_tags, "Help Search" },
          H = { builtin.command_history, "Command History" },
          [":"] = { builtin.commands, "Search Commands" },

          -- Git
          c = { builtin.git_commits, "Git Commits" },
          C = { builtin.git_bcommits, "Git Commits for Current Buffer" },
          b = { builtin.git_branches, "Git Branches" },
          G = { builtin.git_status, "Git Status" },
        },
      }, {
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("undo")
    end,
  },
}
