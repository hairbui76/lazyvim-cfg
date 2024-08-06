-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Remove keybind
keymap.del("n", ";;")
keymap.del("n", ";f")
keymap.del("n", ";r")
keymap.del("n", ";e")
keymap.del("n", ";s")
keymap.del("n", ";c")
keymap.del("n", "s")

-- Bind default navigations NORMAL mode
keymap.set("n", "j", "h", opts)
keymap.set("n", "k", "j", opts)
keymap.set("n", "l", "k", opts)
keymap.set("n", ";", "l", opts)

-- Bind default navigations VISUAL mode
keymap.set("v", "j", "h", opts)
keymap.set("v", "k", "j", opts)
keymap.set("v", "l", "k", opts)
keymap.set("v", ";", "l", opts)

-- Support delete single character without store it in clipboard
keymap.set("n", "x", '"_x')
keymap.set("v", "x", '"_x')

-- Support delete line without store it in clipboard
keymap.set("n", "dd", '"_dd')

-- Go to end of line in Insert mode
keymap.set("i", "<C-e>", "<Esc>A", opts)

-- Jump outside bracket or quote
keymap.set("i", "<C-l>", '<Cmd>lua require("user.functions").jump_out_first_pair()<CR>', opts)

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- History explorer with UndoTree
keymap.set("n", "<Leader>h", ":UndotreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sj", "<C-w>h")
keymap.set("n", "sk", "<C-w>j")
keymap.set("n", "sl", "<C-w>k")
keymap.set("n", "s;", "<C-w>l")

-- Close window
keymap.set("n", "sw", "<C-w>c", opts)
keymap.set("n", "<Leader>q", "<C-w>c", opts)

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Move line NORMAL
keymap.set("n", "<A-l>", ":m .-2<CR>==") -- line up
keymap.set("n", "<A-k>", ":m .+1<CR>==") -- line down

-- Move line VISUAL
keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv") -- line up
keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv") -- line down

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
