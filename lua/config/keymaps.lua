-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>w", "<leader>cf|<C-s>", { desc = "Save file", remap = true })
map("n", "<leader><space>", Snacks.picker.files, { desc = "Save file", remap = true })
-- map("n", "<leader>1", "<C-w>w", { desc = "Switch pane" })
map("n", "<leader>a", "ggVG", { desc = "Select all" })

map("n", "<leader>1", function()
  local explorer_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "snacks_picker_list" then
      explorer_win = win
      break
    end
  end

  local current_win = vim.api.nvim_get_current_win()
  if explorer_win and current_win == explorer_win then
    -- In explorer: jump to previous window (your remembered editor, skipping intermediates)
    vim.cmd("wincmd p")
  elseif explorer_win then
    -- Explorer exists but not focused: switch directly to it
    vim.api.nvim_set_current_win(explorer_win)
  else
    -- No explorer: open it
    Snacks.picker.explorer()
  end
end, { desc = "Toggle explorer/editor focus" })
