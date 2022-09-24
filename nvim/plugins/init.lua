return {

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- minimal modes
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["pocco81/auto-save.nvim"] = {
    -- module = "auto-save",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

  -- notes & todo stuff
  ["nvim-neorg/neorg"] = {
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    setup = function()
      require("custom.plugins.neorg").autocmd()
    end,
    config = function()
      require("custom.plugins.neorg").setup()
    end,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
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
  -- todo高亮
  ["folke/todo-comments.nvim"] = {
    config = function()
      require("custom.plugins.todo-comments").setup()
    end,
  },
  -- markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- 单词和行高亮
  ["yamatsum/nvim-cursorline"] = {
    config = function()
      require("nvim-cursorline").setup()
    end,
  },
  -- git工具
  ["tanvirtin/vgit.nvim"] = {
    after = "base46",
    config = function()
      require("vgit").setup()
    end,
  },
  -- lsp
  ["glepnir/lspsaga.nvim"] = {
    config = function()
      local saga = require "lspsaga"
      saga.init_lsp_saga {
        -- your configuration
        symbol_in_winbar = {
          enable = true,
          click_support = function(node, clicks, button, modifiers)
            -- To see all avaiable details: vim.pretty_print(node)
            local st = node.range.start
            local en = node.range["end"]
            if button == "l" then
              if clicks == 2 then
                -- double left click to do nothing
              else -- jump to node's starting line+char
                vim.fn.cursor(st.line + 1, st.character + 1)
              end
            elseif button == "r" then
              if modifiers == "s" then
                print "lspsaga" -- shift right click to print "lspsaga"
              end -- jump to node's ending line+char
              vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
              -- middle click to visual select node
              vim.fn.cursor(st.line + 1, st.character + 1)
              vim.cmd "normal v"
              vim.fn.cursor(en.line + 1, en.character + 1)
            end
          end,
        },
      }
    end,
  },
  -- golang
  ["ray-x/go.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("go").setup()
    end,
  },
  ["ray-x/guihua.lua"] = {},
  -- github copilot
  ["github/copilot.vim"] = {},
  -- tagbar
  ["liuchengxu/vista.vim"] = {},
}
