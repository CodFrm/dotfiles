[TOC]

# nvim 配置

基于[Nvchad](https://nvchad.github.io/)的配置,本配置参考了[siduck/dotfiles](https://github.com/siduck/dotfiles)

## 常见命令

```bash
# 更新最新neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
./nvim-macos/bin/nvim
# 运行日志
nvim --startuptime nvim.log
```

# 插件

> 此处是比较老的记录了，详情请看[plugins/init.lua](./plugins/init.lua)文件

- jose-elias-alvarez/null-ls.nvim 代码格式化
- nvim-telescope/telescope-ui-select.nvim Telescope codeAction
- williamboman/nvim-lsp-installer lsp 安装工具箱
- folke/todo-comments.nvim TODO 高亮
- Shatur/neovim-session-manager session 管理工具
- BurntSushi/ripgrep Telescope live_grep 工具
- Pocco81/AutoSave.nvim 自动保存
- djoshea/vim-autoread 自动加载
- tanvirtin/vgit.nvim git工具
- iamcco/markdown-preview.nvim markdown预览工具

## 快捷键

> \<C>是control<⌃>,Windows为Ctrl,\<leader>是空格,\<S>是shift 不常用的使用<leader>

- \<C-h/j/k/l>切换窗口
- \<leader>th 切换主题
- \<leader>W 显示隐藏的终端

## 常用指令

> 自定义的指令在[mappings.lua](./mappings.lua)中

### Nvimtree

- \<C-n>打开nvimtree
- a 创建文件,如果以"/"结尾表示创建目录
- r 更新文件名
- d 删除文件
- y 复制文件名
- Y 复制相对路径
- gy 复制绝对路径
- 跳转到上级目录
- s 使用系统默认的软件打开文件
- \<C-v/C-h>以垂直或者水平方式打开文件
- \<C-t>新的tab中打开文件
- \<C-k>查看文件信息
- \<Tab>预览文件
- I 隐藏或显示隐藏文件
- H 隐藏或者显示.文件
- R 刷新目录树
- W 合并文件夹

### 代码相关快捷键

- ca 修复建议
- gD 跳转定义
- gd 跳转声明
- gr 查找引用
- gi 查找接口定义
- \<leader>rn 重命名
- gh 悬浮显示引用
- \<leader>/ 注释代码
- \<leader>fm 格式化
- [e 查看上一个错误
- ]e 查看下一个错误
- <leader>a 打开代码大纲

### buffer相关

- \<Tab> 切换buffer
- \<S-Tab> 切换上一个buffer
- \<leader>fb 查找buffer
- \<leader>bp 顶置buffer
- [b 移动到上一个
- ]b 移动到下一个
- \<leader>bt N 跳转到第n个buffer
- \<leader>q 保存并关闭当前buffer

### 查找相关

- \<leader>fb 搜索buffer
- \<leader>fd 搜索文件
- \<leader>fa 搜索全部文件
- \<leader>fw 关键字搜索

### git相关

- \<leader>gl 查看git commit
- \<leader>gt 查看git status
- [c 跳到上一个更改
- ]c 跳到下一个更改
- \<leader>gc 查看变更
- \<leader>gh 查看文件历史变更
- \<leader>gr 重置当前块
- \<leader>gR 重置当前文件


## 常用命令

- MarkdownPreview 预览markdown文件
