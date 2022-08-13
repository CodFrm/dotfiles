return {
  -- telescope 主要是自定义了一些快捷键
  ["nvim-telescope/telescope.nvim"] = {
    setup = function()
      require("custom.mappings").telescope()
    end,
  },
  -- 代码格式化
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.lsp.null-ls").setup()
    end,
  },
  -- debug 工具
  ["mfussenegger/nvim-dap"] = {
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    setup = function()
      require("custom.mappings").dap()
    end,
  },
  ["leoluz/nvim-dap-go"] = {
    config = function()
      require('dap-go').setup()
    end
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("dapui").setup({})
    end
  },
  -- 代码大纲插件
  ["stevearc/aerial.nvim"] = {
    config = function()
      require('aerial').setup({
        backends = { "treesitter", "lsp", "markdown" },
        default_direction = "prefer_right",
        max_width = { 60 },
        width = { 50 },
        min_width = 10,
      })
      require('telescope').load_extension('aerial')
      require('custom.mappings').aerial()
    end
  },
  -- Telescope code action
  ["nvim-telescope/telescope-ui-select.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  -- Telescope workspace 工作目录
  ["natecraddock/workspaces.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("workspaces").setup({
        hooks = {
          open = { "load_session", "NvimTreeOpen" },
        }
      })
      require("telescope").load_extension("workspaces")
    end
  },
  -- 媒体文件查看
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
        },
      }
      require("telescope").load_extension "media_files"
    end,
  },
  -- lsp安装工具
  ["williamboman/nvim-lsp-installer"] = {
    afer = "nvim-lspconfig"
  },
  -- buffer管理工具
  ["akinsho/bufferline.nvim"] = {
    after = "nvim-web-devicons",

    setup = function()
      require("core.mappings").bufferline()
      require("custom.mappings").bufferline()
    end,

    -- config = function()
    --   require "plugins.configs.bufferline"
    -- end,
  },
  -- 删除buffer不改变layout
  ["famiu/bufdelete.nvim"] = {},
  -- todo高亮
  ["folke/todo-comments.nvim"] = {
    config = function()
      require("custom.plugins.others.todo-comments").setup()
    end
  },
  -- session管理插件
  ["Shatur/neovim-session-manager"] = {
    config = function()
      local Path = require('plenary.path')
      require("session_manager").setup {
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      }

    end,
  },
  -- 配合telescope的文本关键字搜索插件
  -- 需要安装ripgrep: brew install ripgrep
  ["BurntSushi/ripgrep"] = {},
  -- autosave和autoload插件,用于自动保存和加载文件
  ["Pocco81/AutoSave.nvim"] = {
    config = function()
      local autosave = require("autosave")
      autosave.setup(
        {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
      }
      )
    end,
  },
  ["djoshea/vim-autoread"] = {},


}
