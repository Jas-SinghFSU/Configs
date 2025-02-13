-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Git binds
-- LS = require("luasnip")
CONFORM = require("conform")

vim.keymap.set("n", "<leader>gbo", "<cmd>:GitBlameOpenFileURL<CR>", { silent = true })

-- Rename func/variable
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h:h<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>n", ":Neotree reveal toggle float ./ <CR>", { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { silent = true, noremap = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Change the macro keybind from q to Q
-- and disable the q keybind
vim.api.nvim_set_keymap("n", "Q", "q", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", "<Nop>", { noremap = true, silent = true })

-- Bufferline tab switching
vim.keymap.set("n", "<leader>1", ':lua require"bufferline".go_to_buffer(1)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", ':lua require"bufferline".go_to_buffer(2)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", ':lua require"bufferline".go_to_buffer(3)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", ':lua require"bufferline".go_to_buffer(4)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", ':lua require"bufferline".go_to_buffer(5)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", ':lua require"bufferline".go_to_buffer(6)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>7", ':lua require"bufferline".go_to_buffer(7)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>8", ':lua require"bufferline".go_to_buffer(8)<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>9", ':lua require"bufferline".go_to_buffer(9)<CR>', { noremap = true, silent = true })

-- Toggleterm keybinds
vim.keymap.set({ "n", "i", "t" }, "<C-1>", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "t" }, "<C-2>", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "t" }, "<C-3>", "<cmd>3ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "t" }, "<C-4>", "<cmd>4ToggleTerm<CR>", { noremap = true, silent = true })

-- Vertical Split
vim.keymap.set("n", "<leader>vs", "<cmd>:vsp<CR>", { silent = true })

-- Delete current buffer
-- Bind to leader delete
vim.keymap.set("n", "<leader><Del>", "<cmd>:bd<CR>", { silent = true, noremap = true })

-- Save current buffer
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy and Paste keybinds
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>ff", function()
  CONFORM.format({ async = true, lsp_fallback = true })
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/init.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set({ "n", "i" }, "<C-v>", '"+p')

--  LuaSnip snippet keybinds
-- vim.keymap.set({ "i" }, "<C-K>", function()
--   LS.expand()
-- end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-l>", function()
--   LS.jump(1)
-- end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-h>", function()
--   LS.jump(-1)
-- end, { silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
--   if LS.choice_active() then
--     LS.change_choice(1)
--   end
-- end, { silent = true })

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true })

-- Execute scratchpad
vim.keymap.set("n", "<leader>ej", "<cmd>w !node<CR>", { silent = true })

-- Remove keybinds
vim.keymap.del("n", "<leader>e")
