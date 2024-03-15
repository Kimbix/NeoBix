return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- CSharp
        null_ls.builtins.formatting.clang_format,
        -- General
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- GodotScript
        null_ls.builtins.formatting.gdformat,
        null_ls.builtins.diagnostics.gdlint,
      },
    })
    vim.keymap.set("n", "<leader>lF", function()
      vim.lsp.buf.format({
        filter = function(client)
          if (client.name == "omnisharp") then return false end
          return true
        end,
      })
    end, {})
  end,
}
