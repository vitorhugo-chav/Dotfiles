-- lua/core/options.lua
local opt = vim.opt

-- Appearance and Lines
opt.number = true             -- Show current line number
opt.relativenumber = true     -- Relative numbers (great for navigating with j/k)
opt.signcolumn = "yes"        -- Always show the sign column (avoids screen jumping)
opt.termguicolors = true      -- Enable 24-bit colors
opt.wrap = false              -- Disable automatic line breaking (I prefer to scroll)
opt.guicursor = "n-v-c-i-ci-ve:block" -- Force the cursor to be a block

-- Indentation (Default 4 spaces, adjustable per language later)
opt.tabstop = 2               -- Visual width of a tab
opt.shiftwidth = 2            -- Indentation width
opt.expandtab = true          -- Convert tabs to spaces
opt.smartindent = true        -- Automatic smart indentation

-- Search
opt.ignorecase = true         -- Ignore case in searches
opt.smartcase = true          -- If the search includes an uppercase letter, it becomes case-sensitive

-- UX and System
opt.cursorline = true         -- Highlight the cursor line
opt.mouse = "a"               -- Enable mouse in all modes (useful for resizing)
opt.clipboard:append("unnamedplus") -- Use the system clipboard (Ctrl+C / Ctrl+V work)
opt.splitright = true         -- Vertical splits go to the right
opt.splitbelow = true         -- Horizontal splits go down
opt.scrolloff = 8             -- Keep 8 lines of margin when scrolling
opt.undofile = true          -- Save undo history even after closing the file
opt.updatetime = 250          -- Decrease delay for UI updates
opt.swapfile = false          -- Do not use swap files (I prefer not to have hidden files)
opt.cmdheight = 0             -- Command line height (0 with noice.nvim)
opt.history = 1000            -- Save more command history
opt.whichwrap = "<,>,[,],h,l" -- Allow the cursor to move between lines with the arrow keys
opt.breakindent = true        -- Maintain indentation of wrapped lines
opt.shada = "!,'1000,<100,s100,h" -- Increase shada/viminfo history
opt.autochdir = false         -- Do not automatically change the directory to the current file's directory
opt.laststatus = 3            -- Always show the status bar, and make it global
opt.showcmd = true            -- Show partial commands
opt.hidden = true             -- Allow hidden buffers when they are not displayed in a window
opt.inccommand = "split"      -- Show substitution results as you type
opt.completeopt = "menuone,noselect" -- Options for the autocomplete menu
opt.hlsearch = true           -- Highlight all search results
opt.incsearch = true          -- Show search results as you type
opt.showmode = false          -- Do not show the current mode (useful if you already use a statusline plugin)