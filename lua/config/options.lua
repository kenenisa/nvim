-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.diagnostic.config({
  virtual_text = true, -- Display diagnostics as inline text
})

vim.g.copilot_no_tab_map = true -- Disable Copilot default tab mapping
vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.api.nvim_set_keymap("n", "<leader>t", ":lua ToggleFloatingTerminal()<CR>", { noremap = true, silent = true })
local floating_terminal = nil
function ToggleFloatingTerminal()
  if floating_terminal and vim.api.nvim_win_is_valid(floating_terminal.win) then
    vim.api.nvim_win_close(floating_terminal.win, true)
    floating_terminal = nil
  else
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded", -- Add a rounded border
    })

    -- Directly map ESC to close the terminal
    vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Cmd>lua CloseFloatingTerminal()<CR>", {
      noremap = true,
      silent = true,
    })

    vim.fn.termopen(vim.o.shell)
    vim.cmd("startinsert")

    floating_terminal = { buf = buf, win = win }
  end
end

function CloseFloatingTerminal()
  if floating_terminal and vim.api.nvim_win_is_valid(floating_terminal.win) then
    vim.api.nvim_win_close(floating_terminal.win, true)
    floating_terminal = nil
  end
end

-- Highlight group for white border
vim.cmd([[highlight WhiteBorder guifg=white]])
