local M = {}

-- 自定义键位
M.custom = {
  n = {
    ["<leader>cc"] = { ":Telescope <CR>", "打开Telescope" },
  },
  i = {
    ["<C-h>"] = { ':copilot#Accept("<Left>")', "copilot accept" },
  },
}

-- 后续的都是插件相关的配置
M.telescope = {
  n = {
    ["<leader>fb"] = { "<cmd>:Telescope buffers <CR>", "搜索buffer" },
    ["<leader>ff"] = { "<cmd>:Telescope find_files <CR>", "搜索文件" },
    ["<leader>fa"] = {
      "<cmd>:Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      "搜索全部文件",
    },
    ["<leader>fw"] = { "<cmd>:Telescope live_grep <CR>", "搜索关键字" },
    ["<leader>th"] = { "<cmd> :Telescope themes <CR>", "切换主题" },
    ["<leader>W"] = { "<cmd> :Telescope terms <CR>", "显示隐藏的terms" },
  },
}

M.lsp = {
  n = {
    ["ca"] = { "<cmd>Lspsaga code_action <CR>", "修复建议" },
    ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.format() <CR>", "格式化" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration() <CR>", "跳转声明" },
    ["gd"] = { "<cmd>Telescope lsp_definitions <CR>", "跳转定义" },
    ["gh"] = { "<cmd>Lspsaga hover_doc <CR>", "显示定义" },
    ["<leader>rn"] = { "<cmd>Lspsaga rename <CR>", "重命名" },
    ["gr"] = { "<cmd>:Telescope lsp_references <CR>", "查找引用" },
    ["gi"] = { "<cmd>Lspsaga lsp_finder <CR>", "跳转接口定义" },
    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev <CR>", "上一个错误" },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next <CR>", "下一个错误" },
    ["<leader>e"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "所有错误" },
    ["<leader>a"] = { "<cmd>Vista nvim_lsp <CR>", "大纲" },
  },
  v = {
    ["ca"] = { "<cmd><C-U>Lspsaga range_code_action <CR>", "修复建议" },
  },
}

function moveItemRight(originTbl, n)
  local index = nil
  for k, v in ipairs(originTbl) do
    print(v)
    if v == n then
      index = k
    end
  end
  table.remove(originTbl, index)
  if index == #originTbl + 1 then
    table.insert(originTbl, 1, n)
  else
    table.insert(originTbl, index + 1, n)
  end
  return originTbl
end

function moveItemLeft(originTbl, n)
  local index = nil
  for k, v in ipairs(originTbl) do
    if v == n then
      index = k
    end
  end
  table.remove(originTbl, index)
  if index == 1 then
    table.insert(originTbl, #originTbl + 1, n)
  else
    table.insert(originTbl, index - 1, n)
  end
  return originTbl
end

M.bufferline = {
  n = {
    ["<leader>bp"] = { "<cmd>:BufferLineTogglePin <CR>", "顶置buffer" },
    ["[b"] = {
      function()
        local bufs = vim.t.bufs
        bufs = moveItemLeft(bufs, vim.api.nvim_get_current_buf())
        vim.t.bufs = bufs
        vim.cmd "redrawtabline"
      end,
      "移动到上一个tab",
    },
    ["]b"] = {
      function()
        local bufs = vim.t.bufs
        bufs = moveItemRight(bufs, vim.api.nvim_get_current_buf())
        vim.t.bufs = bufs
        vim.cmd "redrawtabline"
      end,
      "移动到下一个tab",
    },
    ["<leader>bt"] = { "<cmd> TbufPick <CR>", "跳转到指定buffer" },
    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "删除当前buffer",
    },
    ["<leader>Q"] = {
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "删除所有buffer",
    },
  },
}

M.vgit = {
  n = {
    ["<leader>gl"] = { "<cmd>:Telescope git_commits <CR>", "查看git commits" },
    ["<leader>gt"] = { "<cmd>:Telescope git_status <CR>", "查看git status" },
    ["[c"] = { "<cmd>:VGit hunk_up <CR>", "跳到上一个更改" },
    ["]c"] = { "<cmd>:VGit hunk_down <CR>", "跳到下一个更改" },
    ["<leader>gc"] = { "<cmd>:VGit buffer_hunk_preview <CR>", "查看变更" },
    ["<leader>gh"] = { "<cmd>:VGit buffer_history_preview <CR>", "查看文件历史变更" },
    ["<leader>gr"] = { "<cmd>:VGit buffer_hunk_reset <CR>", "重置当前块" },
    ["<leader>gR"] = { "<cmd>:VGit buffer_reset <CR>", "重置当前文件" },
  },
}

return M
