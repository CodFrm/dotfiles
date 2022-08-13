return {
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
		module = "auto-save",
		config = function()
		  require("custom.plugins.smolconfigs").autosave()
		end,
	  },
  
	-- notes stuff
	["nvim-neorg/neorg"] = {
	  ft = "norg",
	  after = "nvim-treesitter",
	  config = function()
		require "custom.plugins.neorg"
	  end,
	},
  
	["goolord/alpha-nvim"] = {
	  disable = false,
	  cmd = "Alpha",
	},
  
	["neovim/nvim-lspconfig"] = {
	  config = function()
		require "plugins.configs.lspconfig"
		require "custom.plugins.lspconfig"
	  end,
	},
  
	-- Telescope code action
	["nvim-telescope/telescope-ui-select.nvim"] = {
	  after = "telescope.nvim",
	  config = function()
		require("telescope").load_extension "ui-select"
	  end,
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
}