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
