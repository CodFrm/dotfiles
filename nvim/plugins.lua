local overrides = require "custom.configs.overrides"

return {
    -- 覆盖默认插件配置

    -- 自定义lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {"pmizio/typescript-tools.nvim"},
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "syntax")
            require("nvim-treesitter.configs").setup(opts)

            -- register mdx ft
            vim.filetype.add {
                extension = {
                    mdx = "mdx"
                }
            }

            vim.treesitter.language.register("markdown", "mdx")
        end
    },

    {
        "williamboman/mason.nvim",
        opts = overrides.mason
    },
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

    -- 自定义插件

    -- 自动关闭和重命名html标签
    {
        "windwp/nvim-ts-autotag",
        ft = {"html", "javascriptreact"},
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },

    -- 自动保存
    {
        "pocco81/auto-save.nvim",
		lazy = false,
        config = function()
            require("auto-save").setup()
        end
    },

    -- 媒体文件查看
    {
        "nvim-telescope/telescope-media-files.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"},
        config = function()
            require("telescope").setup {
                extensions = {
                    media_files = {
                        filetypes = {"png", "webp", "jpg", "jpeg"},
                        find_cmd = "rg" -- find command (defaults to `fd`)
                    }
                }
            }
            require("telescope").load_extension "media_files"
        end
    },

    -- todo高亮
    {
        "folke/todo-comments.nvim",
		lazy = false,
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = require("custom.configs.todo-comments")
    },

    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
        ft = {"markdown"},
        build = function()
            vim.fn["mkdp#util#install"]()
        end
    },

    -- 单词和行高亮
    {
        "yamatsum/nvim-cursorline",
		lazy = false,
        config = function()
            require("nvim-cursorline").setup()
        end
    },

    -- git工具
    {
        "tanvirtin/vgit.nvim",
		cmd = {"VGit"},
        dependencies = {"NvChad/base46"},
        config = function()
            require("vgit").setup()
        end
    },

    -- lsp
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require('lspsaga').setup({})
        end,
		event = 'LspAttach',
        dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}
    },

    -- golang
    {
        "ray-x/go.nvim",
        dependencies = {"ray-x/guihua.lua", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter"},
        config = function()
            require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {"ray-x/guihua.lua"},
    -- github copilot
    {"github/copilot.vim", lazy=false },

    -- tagbar
    {"liuchengxu/vista.vim"},
    -- jest
    {"mattkubej/jest.nvim"},
    -- debug工具
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("custom.configs.dap").setup()
        end
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"},
        config = function()
            require("dapui").setup()
        end
    },

    {
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {"mfussenegger/nvim-dap"}
	}
}
