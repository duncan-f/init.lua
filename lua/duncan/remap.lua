local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>n", vim.cmd.Ex)

keymap.set("n", "<leader>pi", vim.cmd.PackerInstall)
keymap.set("n", "<leader>pu", vim.cmd.PackerSync)
keymap.set("n", "<leader>pc", vim.cmd.PackerClean)

-- Tabs
keymap.set("n", "<leader>nt",	vim.cmd.tabnew)
keymap.set("n", "<leader>ct",	vim.cmd.tabclose)
keymap.set("n", "<leader>pt",	vim.cmd.tabprevious)
keymap.set("n", "<leader>nn",	vim.cmd.tabnext)

-- map keys for Copy/Pasting
keymap.set("x", "<leader>p", "\"_dP")
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "gg\"+yG")
keymap.set("v", "<leader>d", "\"+d")
keymap.set("n", "<leader>v", "\"+p")
keymap.set("n", "<leader>a", "<Esc>\"_ggVG")

-- map navigation keys
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Window Management
keymap.set("n", "<leader>sv", vim.cmd.vsplit, opts)
keymap.set("n", "<leader>sh", vim.cmd.split, opts)
keymap.set("n", "<leader>sm", vim.cmd.MaximizerToggle, opts)

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

keymap.set("n", "<leader>bn", ":bn<CR>")
keymap.set("n", "<leader>bp", ":bp<CR>")

-- compiler on writing to file
keymap.set("n", "<leader>c", ":w! <bar> !compiler <c-r>%<CR>")

-- run Python files
keymap.set("n", "<leader>t", ":!python %<CR>")

-- Make file exacutable
keymap.set("n", "<leader>x", ":!chmod +x <c-r>%<CR>")

-- Open corresponding .pdf/.html or preview
keymap.set("n", "<leader>pw", ":!opout <c-r>%<CR><CR>")

keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Clear tex files builds
vim.api.nvim_create_autocmd({'VimLeave'}, { pattern = '*.tex', command = '!texclear %' })

-- Ensure of filetype when a new/read file is opened
vim.api.nvim_create_autocmd({'BufRead','BufNewFile'}, { pattern = '*.tex', command = 'set filetype=tex' })

-- source config files when saving
vim.api.nvim_create_autocmd({'BufWritePost'}, { pattern = '*bashrc,*zshrc', command = '!source %' })
vim.api.nvim_create_autocmd({'BufWritePost'}, { pattern = '*Xresources,*Xdefaults', command = '!xrdb %' })
vim.api.nvim_create_autocmd({'BufWritePost'}, { pattern = 'files,directories', command = '!shortcuts' })

-- Delete trailing spaces when saving files
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

