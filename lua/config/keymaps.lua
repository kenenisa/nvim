-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use `vim.keymap.set` instead
local map = vim.keymap.set

map("n", "<leader>w", "<leader>cf|<C-s>", { desc = "Save file", remap = true })
map("n", "<leader>1", "<C-w>w", { desc = "Switch pane" })

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept the currently selected item
    ["<CR>"] = cmp.mapping.close(), -- Optionally disable Enter for accepting suggestions
  },
})
