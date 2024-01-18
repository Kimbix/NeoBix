return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
      })
      require("telescope").load_extension("ui-select")

      local builtin = require("telescope.builtin")
      local wk = require("which-key")
      wk.register({
        f = {
          name = "Telescope",
          -- FILES
          f = { builtin.find_files, "Find Files" },
          o = { builtin.oldfiles, "Old Files" },
          g = { builtin.live_grep, "Grep String" },

          -- NEOVIM
          ["?"] = { builtin.help_tags, "Help Search" },
          H = { builtin.command_history, "Command History" },
          [":"] = { builtin.commands, "Search Commands" },

          -- LSP
          d = { builtin.lsp_definitions, "LSP Definitions" },
          t = { builtin.lsp_type_definitions, "LSP Type Definitions" },
          s = { builtin.lsp_document_symbols, "LSP Document Symbols" },
          S = { builtin.lsp_workspace_symbols, "LSP Workspace Symbols" },
          ["C-s"] = { builtin.lsp_dynamic_workspace_symbols, "LSP Global Symbols" },
          i = { builtin.lsp_implementations, "LSP Implementations" },
          r = { builtin.lsp_references, "LSP References" },
          D = { builtin.diagnostics, "LSP Errors" },

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
}
