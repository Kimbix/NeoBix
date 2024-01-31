return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    local gs = require("gitsigns")
    gs.toggle_numhl()
    local wk = require("which-key")
    wk.register({
      g = {
        name = "Git",

        -- Navigation
        n = { gs.next_hunk, "Go to Next Hunk" },
        N = { gs.prev_hunk, "Go to Previous Hunk" },
        v = { gs.select_hunk, "Select Current Hunk" },

        -- Hunk Management
        s = { gs.stage_hunk, "Stage Hunk" },
        S = { gs.stage_buffer, "Stage Buffer" },
        u = { gs.undo_stage_hunk, "Undo Stage Hunk" },
        R = { gs.reset_hunk, "Reset Hunk" },

        -- Preview
        p = { gs.preview_hunk, "Preview Hunk" },
        P = { gs.preview_hunk_inline, "Preview Hunk in File" },

        -- View
        h = { gs.toggle_linehl, "Toggle Line Highlight" },
        d = { gs.toggle_deleted, "Toggle Deleted Hunks" },
        w = { gs.toggle_word_diff, "Toggle Word Diff" },

        -- Diff
        D = { "<CMD>Neotree close<CR> <CMD>Gitsigns diffthis<CR>", "Diff File" },

        b = {
          function()
            gs.blame_line({ full = true })
          end,
          "Get Blame for Hunk",
        },
      },
    }, {
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    })
  end,
}
