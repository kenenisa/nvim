-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use `vim.keymap.set` instead
local map = vim.keymap.set

map("n", "<leader>w", "<leader>cf|<C-s>", { desc = "Save file", remap = true })
map("n", "<leader>1", "<C-w>w", { desc = "Switch pane" })
map("n", "<leader>a", "ggVG", { desc = "Select all" })

local blink = require("blink.cmp")

blink.setup({
  keymap = {
    preset = "default", -- Start with the default preset

    -- <Tab> confirms the current selection
    ["<Tab>"] = {
      function(cmp)
        return cmp.accept({ select = true }) -- Confirm selection
      end,
      "fallback", -- Fall back to the next keymap if no completion is active
    },

    -- <CR> closes the completion menu
    ["<CR>"] = {
      function(cmp)
        return cmp.hide() -- Close the menu
      end,
      "fallback", -- Fall back if no completion is active
    },
  },
})
