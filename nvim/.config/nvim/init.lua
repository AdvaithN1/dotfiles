-- Load options first
require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and tell it to look in the lua/plugins folder
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- This imports everything in lua/plugins/
  },
  change_detection = {
    notify = false,
  },
})

-- Load keymaps and autocmds after plugins
require("config.keymaps")
require("config.autocmds")

-- Set colorscheme (if not already set in catppuccin config)
vim.cmd.colorscheme("catppuccin")
