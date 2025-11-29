-- lua/plugins/ui.lua
-- Single file for all User Interface (UI) related plugins

return {
  -- 1. THEME (Colorscheme)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "dark",
          floats = "dark",
        },
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  },

  -- 2. INITIAL PANEL (Dashboard)
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ASCII Logo
      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }
      dashboard.section.header.opts.hl = "String"

      -- Menu shortcuts
      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find Files", "<cmd>Telescope find_files<cr>"),
        dashboard.button("n", "  New File", "<cmd>enew<cr>"),
        dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "󰊢  Find Text", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("c", "  Settings", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
      }
      dashboard.section.buttons.opts.hl = "Dashboard"

      -- Final config
      alpha.setup(dashboard.opts)
    end,
  },

  -- 3. STATUS LINE (Lualine)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = {}, winbar = {} },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
      })
    end,
  },

  -- 4. TAB LINE (Bufferline)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "thick",
          indicator = { style = "icon", icon = "▎" },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          offsets = {
            {
              filetype = "neo-tree",
              text = "EXPLORER",
              text_align = "center",
              separator = true
            }
          }
        },
      })
    end,
  },
  
  -- 5. FILE EXPLORER (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "NeoTree: Toggle" },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<cr>"] = "open",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },

  -- 6. COMMAND AND NOTIFICATION INTERFACE (Noice)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },

  -- 7. NOTIFICATIONS (nvim-notify)
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      timeout = 3000,
      render = "default",
      stages = "fade",
      background_colour = "NotifyBackground",
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
    keys = {
      {
        "<leader>un",
        function() require("notify").dismiss({ silent = true, pending = true }) end,
        desc = "Dismiss notifications",
      },
    },
  },

  -- 8. INDENTATION LINES
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = true, show_end = true },
    },
  },

  -- 9. CONTEXT HIGHLIGHTING (hlchunk)
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#806d9c",
        },
        blank = { enable = false }, -- Disabled to use indent-blankline
      })
    end,
  },

  -- 10. ZEN MODE (Total Focus)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode (Focus)" },
    },
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
        },
      },
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = false },
      },
    },
  },

  -- 11. VIRTUAL COLUMN (Line limit marker)
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufRead",
    opts = {
      char = "┊",
      virtcolumn = "80,120",
      highlight = "NonText",
    },
  },

  -- 12. KEYMAP GUIDE (Which-key)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      plugins = { spelling = true },
      -- CORRECTION 1: 'window' agora é 'win'
      win = { border = "rounded" }, 
      -- CORRECTION 2: Nova sintaxe 'spec' substituindo o antigo .register()
      spec = {
        { "<leader>c", group = "[C]ode" },
        { "<leader>d", group = "[D]ebug/[D]iff" },
        { "<leader>f", group = "[F]ind/[F]ormat" },
        { "<leader>g", group = "[G]it" },
        { "<leader>l", group = "[L]azy/[L]SP" },
        { "<leader>s", group = "[S]plit/[S]pectre" },
        { "<leader>t", group = "[T]ab/[T]oggle" },
        { "<leader>u", group = "[U]I" },
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}