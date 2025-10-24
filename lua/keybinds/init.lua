vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":Ex<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-n>", ":Ex<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<C-k>', ':m -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':m +1<CR>', { noremap = true, silent = true })


--Telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

--Terminal keybinds
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { noremap = true, silent = true })
