require("config.lazy")

--set strings number
vim.cmd("set number")
vim.cmd("set relativenumber")

--set syntax lighting
vim.cmd("syntax on")

--set tabs size
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

--set colorscheme
vim.cmd[[colorscheme catppuccin-mocha]]

--telescope settings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })

--configuring icons
vim.opt.termguicolors = true

--enabling neotree
vim.cmd("Neotree")

--enabling lualine
require('lualine').setup()

--enabling keybinds for tabby
vim.api.nvim_set_keymap("n", "<C-n>", ":$tabnew<CR>", { noremap = true })
