vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- For automatic image updates
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.webp" },
  callback = function()
    pcall(function()
      Snacks.image.image.clear()
      vim.cmd("silent! edit!")
    end)
  end,
})

local opt = vim.opt

opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
opt.backup = true
opt.writebackup = true
opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup")
opt.clipboard = "unnamedplus"
opt.wrap = false
