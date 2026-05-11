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

-- LSP Stuff
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
