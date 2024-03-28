-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
map("n", "<leader>gw", "<cmd>HopWord<cr>", { desc = "HopWord" })
map("n", "<leader>gc", "<cmd>HopChar2<cr>", { desc = "HopChar2" })
map("n", "<leader>wt", "<cmd>call TerminalOpen()<cr>", { desc = "TerminalOpen" })
map("n", "<leader>wq", "<cmd>call TerminalDelete()<cr>", { desc = "TerminalDelete" })
map("n", "<leader>wx", "<cmd>quit<cr>", { desc = "window quit" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "window only" })
