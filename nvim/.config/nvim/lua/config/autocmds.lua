-- Automatically enter insert mode in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Autosave when losing focus of a buffer
local autosave_group = vim.api.nvim_create_augroup("AutosaveFocusLost", { clear = true })

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = autosave_group,
  pattern = "*",
  callback = function()
    -- Only save if the buffer is modified and has a name
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! update")
    end
  end,
})
