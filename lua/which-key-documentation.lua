local builtin = require("telescope.builtin")
local wk = require("which-key")
wk.register({
  f = {
    name = "Telescope",
    f = {
      builtin.find_files,
      "Find Files",
    },
    r = {
      builtin.oldfiles,
      "Recent Files",
    },
    g = {
      builtin.live_grep,
      "Grep String",
    },

    -- NEOVIM
    H = {
      builtin.command_history,
      "Command History",
    },
    [":"] = {
      builtin.commands,
      "Search Commands",
    },

    -- LSP
    d = {
      builtin.diagnostics,
      "LSP Errors",
    },

  },
}, {
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
