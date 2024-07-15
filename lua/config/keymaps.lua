-- keymaps.lua

local keymap = vim.keymap.set
local map = keymap
local opts = { noremap = true, silent = true }

-- Delete without yanking
keymap("n", "x", '"_x', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Save file and quit
keymap("n", "<Leader>w", ":update<CR>", opts)
-- save file
keymap("n", "<Leader>q", ":quit<CR>", opts)
keymap("n", "<Leader>Q", ":qa<CR>", opts)
keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Tabs Buffer
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<s-tab>", ":bprev<CR>", opts)
keymap("n", "tw", ":bdelete<CR>", opts)

-- Split window
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- Move to window using the <shift> arrow keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- scroll lines using the <shift> arrow keys
map("n", "<S-Up>", "<C-u>", { desc = "Scroll Up", remap = true })
map("n", "<S-Down>", "<C-d>", { desc = "Scroll Down", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- floating terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
keymap("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
keymap("n", "<leader>fT", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })
keymap("n", "<C-/>", lazyterm, { desc = "Terminal (Root Dir)" })
