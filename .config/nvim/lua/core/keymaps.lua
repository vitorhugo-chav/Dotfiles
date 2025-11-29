-- lua/core/keymaps.lua
-- Keymap center

-- Set the leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set -- for conciseness

--==============================================================================
-- NORMAL (n) AND VISUAL (v) MODES
--==============================================================================

-- Exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit Insert mode" })

-- Clear search highlight
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- Delete without copying to the register
map("n", "x", '"_x')

-- Indentation in visual mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move selected lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Toggle paste mode
map("n", "<leader>p", ":set paste!<CR>", { desc = "Toggle paste mode" })

--==============================================================================
-- WINDOW MANAGEMENT (Splits)
--==============================================================================

map("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" })
map("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })
map("n", "<leader>sm", "<C-w>_ | <C-w>|", { desc = "Maximize current split" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Increase width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Decrease width" })

--==============================================================================
-- TAB MANAGEMENT
--==============================================================================

map("n", "<leader>to", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })
map("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open file in new tab" })

--==============================================================================
-- DEBUGGING (DAP - Debug Adapter Protocol)
--==============================================================================

map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP: Continue" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP: Step Into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "DAP: Step Over" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "DAP: Step Out" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "DAP: Open REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "DAP: Run Last" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "DAP: Terminate" })
map("n", "<leader>dui", function() require("dapui").toggle() end, { desc = "DAP: Toggle UI" })