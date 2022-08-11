-- Just an example, supposed to be placed in /lua/custom/

local userPlugins = require("custom.plugins")

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "palenight",
}

M.plugins = {
  override = {
    -- 配置nvimtree
    ["kyazdani42/nvim-tree.lua"] = {
      filters = {
        dotfiles = false,
        custom = { ".git" },
      },
      git = {
        enable = true,
        ignore = false,
      }
    }, ["nvim-telescope/telescope.nvim"] = {
      defaults = {
        prompt_prefix = " ",
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_cursor {
            -- even more opts
          }
        }, workspaces = {
          keep_insert = true,
        }
      },
    },
    -- 对齐线
    ["lukas-reineke/indent-blankline.nvim"] = {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    },
    -- 错误提示
    ["akinsho/bufferline.nvim"] = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end,
      }
    },
    -- 代码高亮
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "go",
        "html", "css", "vim", "lua", "javascript", "typescript", "tsx"
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        }
      },
    }
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lsp.lspconfig",
    },
  },

  user = userPlugins,

}

return M
