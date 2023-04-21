-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

keymap("n", "<C-z>", "<nop>", default_opts)
keymap("n", "<PageDown>", "<nop>", default_opts)
keymap("i", "<PageDown>", "<nop>", default_opts)
