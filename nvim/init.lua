-- 相对行数
vim.wo.relativenumber = true

-- 选中高亮
vim.cmd [[ highlight LspReferenceText cterm=reverse gui=reverse ]]

vim.g.copilot_proxy = "127.0.0.1:7890"
