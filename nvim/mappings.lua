local M = {}
local map = require("core.utils").map

M.telescope = function()
  -- 搜索buffer
  map("n", "<leader>fb", "<cmd>:Telescope buffers <CR>")
  -- 搜索文件
  map("n", "<leader>ff", "<cmd>:Telescope find_files <CR>")
  -- 搜索全部文件
  map("n", "<leader>fa", "<cmd>:Telescope find_files follow=true no_ignore=true hidden=true <CR>")
  -- 搜索关键字
  map("n", "<leader>fw", "<cmd>:Telescope live_grep <CR>")
  -- 查看git commits
  map("n", "<leader>gl", "<cmd>:Telescope git_commits <CR>")
  -- 查看git status
  map("n", "<leader>gt", "<cmd>:Telescope git_status <CR>")
  -- 切换主题
  map("n", "<leader>th", "<cmd> :Telescope themes <CR>")
  -- 显示隐藏的terms
  map("n", "<leader>W", "<cmd> :Telescope terms <CR>")
end

M.lsp = function()
  -- 修复建议
  map("n", "ca", "<cmd>lua vim.lsp.buf.code_action() <CR>")
  map("v", "ca", "<cmd>lua vim.lsp.buf.range_code_action() <CR>")
  -- 格式化
  map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting_sync() <CR>")
  -- 跳转声明
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration() <CR>")
  -- 跳转定义
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition() <CR>")
  -- 显示定义
  map("n", "gh", "<cmd>lua vim.lsp.buf.hover() <CR>")
  -- 重命名
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename() <CR>")
  -- 查找引用
  map("n", "gr", "<cmd>:Telescope lsp_references <CR>")
  -- 跳转接口定义
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation() <CR>")
end

M.bufferline = function()
  -- 顶置buffer
  map("n", "<leader>bp", "<cmd>:BufferLineTogglePin <CR>")
  -- 移动到上一个
  map("n", "<leader>bu", "<cmd>:BufferLineMovePrev <CR>")
  -- 移动到下一个
  map("n", "<leader>bd", "<cmd>:BufferLineMoveNext <CR>")
  -- 跳转到第n个buffer
  map("n", "bt", ":BufferLineGoToBuffer ")
  -- 删除当前buffer
  map("n", "<leader>q", "<cmd>:w | :lua require('bufdelete').bufdelete(0, true) <CR>")
  -- 强制删除当前buffer

end

M.aerial = function()
  -- 打开代码大纲
  -- map("n","ga","<cmd>:AerialOpen right<CR>")
  -- 关闭代码大纲
  -- map("n","<leader>ac","<cmd>:AerialClose <CR>")

end

M.dap = function()
  -- 设置断点
  map("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint() <CR>")
  -- 设置条件断点
  map("n", "<leader>bB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>")

end

return M
