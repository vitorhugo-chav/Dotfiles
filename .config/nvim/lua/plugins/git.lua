-- lua/plugins/git.lua
-- File for Git related plugins

return {
  -- 1. GITSIGNS (Signs on the side, blame, etc)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      current_line_blame = false,
      current_line_blame_opts = { delay = 500 },
    },
    keys = {
      { "]c", function() require("gitsigns").nav_hunk("next") end, desc = "Next Hunk (Git)" },
      { "[c", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous Hunk (Git)" },
      { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
      { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame Line" },
      { "<leader>gt", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle Blame (Line)" },
    }
  },

  -- 2. FUGITIVE (Git Wrapper)
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git Status (Fugitive)" },
    }
  },

  -- 3. LAZYGIT (TUI Interface for Git)
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    }
  },

  -- 4. DIFFVIEW (Diff Viewer)
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: File History" },
    }
  }
}