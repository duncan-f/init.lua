vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pi", vim.cmd.PackerInstall)
vim.keymap.set("n", "<leader>pu", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>pc", vim.cmd.PackerClean)

-- Tabs
vim.keymap.set("n", "<leader>nt",	vim.cmd.tabnew)
vim.keymap.set("n", "<leader>ct",	vim.cmd.tabclose)
vim.keymap.set("n", "<leader>pt",	vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>nn",	vim.cmd.tabnext)

-- map keys for Copy/Pasting
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "gg\"+yG")
vim.keymap.set("v", "<leader>d", "\"+d")
vim.keymap.set("n", "<leader>v", "\"+p")
vim.keymap.set("n", "<leader>a", "<Esc>\"_ggVG")

-- map navigation keys
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-S-n>", ":bn")
vim.keymap.set("n", "<C-S-p>", ":bp")

-- compiler on writing to file
vim.keymap.set("n", "<leader>c", ":w! <bar> !compiler <c-r>%<CR>")

-- Make file exacutable
vim.keymap.set("n", "<leader>x", ":!chmod +x <c-r>%<CR>")

-- Open corresponding .pdf/.html or preview
vim.keymap.set("n", "<leader>pw", ":!opout <c-r>%<CR><CR>")

-- Clear tex files builds
vim.api.nvim_create_autocmd('VimLeave', { pattern = '*.tex', command = '!texclear %' })

-- Ensure of filetype when a new/read file is opened
vim.api.nvim_create_autocmd('BufRead,BufNewFile', { pattern = '*.tex', command = 'set filetype=tex' })

-- source config files when saving
vim.api.nvim_create_autocmd('BufWritePost', { pattern = '*bashrc,*zshrc', command = '!source %' })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = '*Xresources,*Xdefaults', command = '!xrdb %' })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = 'files,directories', command = '!shortcuts' })

-- Delete trailing spaces when saving files
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

