
-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
-- map("n", "<leader>q", ":q <CR>")

-- require("my autocmds file") or just declare them here
-- 一些配置
vim.wo.relativenumber = true

-- 选中高亮
vim.cmd [[ highlight LspReferenceText cterm=reverse gui=reverse ]]


