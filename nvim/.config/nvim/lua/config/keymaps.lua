local map = vim.keymap.set

-- Pane navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<leader>q", ":close<CR>", { desc = "Close Split" })
map("n", "<leader>\\", ":vsplit<CR>", { desc = "Split Vertical" })
map("n", "<leader>-", ":split<CR>", { desc = "Split Horizontal" })

map("n", "<C-b>", ":bprevious<CR>")
map("n", "<C-n>", ":bnext<CR>")

-- Visual Mode Indentation
map("v", "<Tab>", ">gv", { noremap = true, silent = true })
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Normal mode: Paste and then re-indent the entire pasted range
vim.keymap.set("n", "p", "p=`]", { desc = "Paste and re-indent block" })
vim.keymap.set("n", "P", "P=`]", { desc = "Paste and re-indent block (before)" })
-- Visual mode: Paste over selection and re-indent
vim.keymap.set("v", "p", "p=`]", { desc = "Paste and re-indent block" })

-- Comments
map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-/>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })

-- Terminal Navigation
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Insert mode scrolling
map("i", "<C-e>", "<C-o><C-e>", { noremap = true, silent = true })
map("i", "<C-y>", "<C-o><C-y>", { noremap = true, silent = true })
map("i", "<C-d>", "<C-o><C-d>", { noremap = true, silent = true })
map("i", "<C-u>", "<C-o><C-u>", { noremap = true, silent = true })

-- Yanking
vim.keymap.set("n", "<leader>ya", ":%y<CR>", { desc = "Yank all" })

-- Snacks picker stuff
-- files
local function snacks_find_directories()
  Snacks.picker({
    title = "Search Directories",
    finder = "proc", -- Use the process finder to run arbitrary commands
    cmd = "fd",
    args = { "--type", "d", "--strip-cwd-prefix" },
    format = "file", -- Formats the output with file/directory icons
    transform = function(item)
      -- Map the output string (item.text) to a file path
      item.file = item.text
      item.dir = true
    end,
    -- Define what happens when you press Enter
    confirm = function(picker, item)
      picker:close()
      if item then
        -- Open the selected directory in Oil
        require("oil").open(item.file)
      end
    end,
  })
end

vim.keymap.set("n", "<leader>fp", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fd", snacks_find_directories, { desc = "Find Directories (Oil)" })
vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fo", function()
  Snacks.picker.recent()
end, { desc = "Find Old/Recent Files" })

-- Git
vim.keymap.set("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- LSP Stuff
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
