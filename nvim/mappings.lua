local M = {}

-- 自定义键位
M.custom = {
    n = {
        ["<leader>cc"] = {":Telescope <CR>", "打开Telescope"},
    }
}

-- 后续的都是插件相关的配置
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
        ["gi"] = {"<cmd>lua vim.lsp.buf.implementation() <CR>", "跳转接口定义"},
        ["<leader>ne"]={"<cmd>lua vim.lsp.diagnostic.goto_next() <CR>","下一个错误"},
        ["<leader>pe"]={"<cmd>lua vim.lsp.diagnostic.goto_prev() <CR>","上一个错误"},
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
        ["<leader>bt"] = {"<cmd> TbufPick <CR>", "跳转到指定buffer"},
        ["<leader>q"] = { function()
            require("core.utils").close_buffer()
          end, "删除当前buffer"}
    }
}

return M
