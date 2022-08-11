local M = {}

M.custom = {
    n = {
        ["<leader>cc"] = {":Telescope <CR>", "打开Telescope"},
        ["<leader>q"] = {":q <CR>", "退出"}
    }
}

M.telescope = {
    n = {
        ["<leader>fb"] = {"<cmd>:Telescope buffers <CR>", "搜索buffer"},
        ["<leader>ff"] = {"<cmd>:Telescope find_files <CR>", "搜索文件"},
        ["<leader>fa"] = {"<cmd>:Telescope find_files follow=true no_ignore=true hidden=true <CR>", "搜索全部文件"},
        ["<leader>fw"] = {"<cmd>:Telescope live_grep <CR>", "搜索关键字"},
        ["<leader>gl"] = {"<cmd>:Telescope git_commits <CR>", "查看git commits"},
        ["<leader>gt"] = {"<cmd>:Telescope git_status <CR>", "查看git status"},
        ["<leader>th"] = {"<cmd> :Telescope themes <CR>", "切换主题"},
        ["<leader>W"] = {"<cmd> :Telescope terms <CR>", "显示隐藏的terms"}
    }
}

M.lsp = {
    n = {
        ["ca"] = {"<cmd>lua vim.lsp.buf.code_action() <CR>", "修复建议"},
        ["<leader>fm"] = {"<cmd>lua vim.lsp.buf.formatting_sync() <CR>", "格式化"},
        ["gD"] = {"<cmd>lua vim.lsp.buf.declaration() <CR>", "跳转声明"},
        ["gd"] = {"<cmd>lua vim.lsp.buf.definition() <CR>", "跳转定义"},
        ["gh"] = {"<cmd>lua vim.lsp.buf.hover() <CR>", "显示定义"},
        ["<leader>rn"] = {"<cmd>lua vim.lsp.buf.rename() <CR>", "重命名"},
        ["gr"] = {"<cmd>:Telescope lsp_references <CR>", "查找引用"},
        ["gi"] = {"<cmd>lua vim.lsp.buf.implementation() <CR>", "跳转接口定义"}
    },
    v = {
        ["ca"] = {"<cmd>lua vim.lsp.buf.range_code_action() <CR>", "修复建议"}
    }
}

M.bufferline = {
    n = {
        ["<leader>bp"] = {"<cmd>:BufferLineTogglePin <CR>", "顶置buffer"},
        ["<leader>bu"] = {"<cmd>:BufferLineMovePrev <CR>", "移动到上一个"},
        ["<leader>bd"] = {"<cmd>:BufferLineMoveNext <CR>", "移动到下一个"},
        ["bt"] = {":BufferLineGoToBuffer ", "跳转到第n个buffer"},
        ["<leader>q"] = {"<cmd>:w | :lua require('bufdelete').bufdelete(0, true) <CR>", "删除当前buffer"}
    }
}

M.aerial = {}

M.dap = {
    n = {
        ["<leader>bb"] = {"<cmd>lua require'dap'.toggle_breakpoint() <CR>", "设置断点"},
        ["<leader>bB"] = {"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>", "设置条件断点"}
    }
}

return M
