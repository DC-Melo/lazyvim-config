-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.cmd("source $HOME/.config/nvim/lua/vimscript/vimrc.custom.config.rc.vim")
vim.cmd("source $HOME/.config/nvim/lua/vimscript/tabular/autoload/tabular.vim")
vim.cmd("source $HOME/.config/nvim/lua/vimscript/tabular/plugin/Tabular.vim")

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set
map("n", "<leader>gw", "<cmd>HopWord<cr>", { desc = "HopWord" })
map("n", "<leader>gc", "<cmd>HopChar2<cr>", { desc = "HopChar2" })

map("n", "<leader>wx", "<cmd>quit<cr>", { desc = "window quit" })
map("n", "<leader>wo", "<cmd>Outline<cr>", { desc = "Toggle outline" })
map("n", "<leader>wm", "<cmd>lua muttToggle()<CR>", { desc = "mutt" })
map("n", "<leader>ww", "<cmd>lua w3mToggle()<CR>", { desc = "w3m search" })
map("v", "<leader>ww", '"vy<cmd>lua w3mToggle(get_visual_selection())<CR>', { desc = "w3m search" })

-- "vy<cmd>call writefile(getreg('v', 1, 1), $HOME.'/.config/reg/filev')  <cr>",
map(
  "v",
  "<leader>yv",
  '"vy<cmd>call writefile(getreg("v", 1, 1), $HOME."/.config/reg/filev")  <cr>',
  { desc = "yank to filev" }
)
map(
  "v",
  "<leader>ss",
  '"zy<cmd>lua require("telescope.builtin").grep_string({search=vim.fn.getreg("z")})<CR>',
  { desc = "search select" }
)

function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, "\n")
end

local Terminal = require("toggleterm.terminal").Terminal
local w3m = Terminal:new({
  cmd = "w3m -B",
  -- cmd = "w3m -B",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function w3mToggle(text)
  if text == nil or text == "" then
    w3m.cmd = "w3m -B"
  else
    w3m.cmd = "w3m 'https://www.google.com/search?q=" .. text .. "'"
  end
  w3m:toggle()
end

local mutt = Terminal:new({
  cmd = "mutt",
  -- cmd = "w3m -B",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function muttToggle()
  mutt:toggle()
end
