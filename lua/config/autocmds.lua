-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd("source $HOME/.config/nvim/lua/vimscript/vimrc.custom.config.rc.vim")
vim.cmd("source $HOME/.config/nvim/lua/vimscript/tabular/autoload/tabular.vim")
vim.cmd("source $HOME/.config/nvim/lua/vimscript/tabular/plugin/Tabular.vim")
