-- lua/plugins/tools.lua
-- Collection of tools and utilities to improve productivity

return {
  -- 1. QUICK NAVIGATION (Harpoon)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      local map = vim.keymap.set
      map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
      map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })
      map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to 1" })
      map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to 2" })
      map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to 3" })
      map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to 4" })
    end,
  },

  -- 2. "TELEPORT" IN CODE (Flash)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash (Jump)" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash (Treesitter)" },
    },
  },

  -- 3. GLOBAL SEARCH AND REPLACE (Spectre)
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Spectre: Replace in project" },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Spectre: Replace word" },
      { "<leader>sf", function() require("spectre").open_file_search() end, desc = "Spectre: Replace in file" },
    },
  },

  -- 4. NAVIGATION BETWEEN VIM AND TMUX
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Navigate Left (Tmux)" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Navigate Down (Tmux)" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Navigate Up (Tmux)" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Navigate Right (Tmux)" },
    },
  },

  -- 5. HEX COLOR PAINTER (Colorizer)
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      user__default_options = {
        mode = "background",
        names = true,
      },
      filetypes = { "*" },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },

  -- 6. SMART COMMENTS
  {
    "numToStr/Comment.nvim",
    opts = {
      -- Add a space between the cursor and the comment character
      padding = true,
      -- Allow commenting empty lines
      comment_empty = true,
      -- Use nvim-ts-context-commentstring for smart detection of comment strings
      comment_function = nil,
    },
    config = function(_, opts)
      require('Comment').setup(opts)
    end,
    keys = {
      { "gc", function() require("Comment.api").toggle.linewise.current() end, mode = "n", desc = "Comment line (normal)" },
      { "gc", function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end, mode = "v", desc = "Comment lines (visual)" },
    },
  },

  -- 7. FLOATING TERMINAL
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "float",
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
}