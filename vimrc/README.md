# idea配置

## ideavim配置
> nvim 太难配置了,养成的感觉主要还是键位,不如直接使用ideavim了
> 
> 20220811年记:更新了一次插件和Nvchad后,我的nvim炸了,宣布放弃T_T

使用:actionlist可查看所有命令

## vscode配置
vscode安装vim插件后开启首选项:`vim.vimrc.enable`,然后配置`vim.vimrc.path`为`~/.vscodevimrc`

可使用[setting.json](setting.json)替换配置

### 常用

- \<leader>fw 搜索关键字

### 选中
> 需要是visual模式
- \<leader>a 选中所有相同关键字
- \<leader>n 选中下一个关键字

### 代码

- gd 跳转定义
- gr 跳转引用
- gi 跳转接口实现
- gh 显示定义
- rn 重命名
- fm 格式化代码
- \<leader>ne 下一个错误
- \<leader>pe 上一个错误

### 书签

- \<leader>bc 添加书签
- \<leader>bl 查看书签
- \<leader>br 重命名书签
- \<leader>bn 跳转下一个书签
- \<leader>bp 跳转上一个书签

### tab操作

- \<leader>q 关闭tab
- \<Tab> 下一个tab
- \<S-Tab> 上一个tab
- \<leader>td 移动tab到下方
- \<leader>tr 移动tab到右侧
- \<leader>ns 下一个切分窗口
- \<leader>ps 上一个切分窗口
- \<leader>sd 取消切分
- \<leader>sh 垂直切分
- \<leader>sv 水平切分

### debug

- \<leader>dp 设置断点
- \<leader>db 开始调试
- \\s 单步执行(不进入函数)
- \\S 单步执行(进入函数)
- \<leader>ds 继续运行
- \<leader>dS 停止调试

### 其他

- \<leader>cr 复制引用

