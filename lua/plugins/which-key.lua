return {
  "folke/which-key.nvim",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      w = {
        name = "Splits Management",

        -- Create and Close Splits
        s = { "<CMD>vsplit<CR>", "Split Vertically" },
        S = { "<CMD>split<CR>", "Split Horizontally" },
        q = { "<CMD>wq<CR>", "Close Split" },
        Q = { "<CMD>q!<CR>", "Close Without Saving" },

        -- Move Around
        l = { "<CMD>wincmd l<CR>", "Move to Right Split" },
        k = { "<CMD>wincmd k<CR>", "Move to Upper Split" },
        j = { "<CMD>wincmd j<CR>", "Move to Lower Split" },
        h = { "<CMD>wincmd h<CR>", "Move to Left Split" },

        ["`"] = { "<CMD>bot split term://zsh<CR> i", "Open terminal on bottom" },

      },
    }, {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    })
  end,
}
