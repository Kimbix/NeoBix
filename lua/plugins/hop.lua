return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({})
    local wk = require("which-key")
    wk.register({
      f = { "<CMD>HopChar1<CR>", "Hop to Char" }
    }, {
      mode = "n",
      prefix = "f",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    })
  end,
}
