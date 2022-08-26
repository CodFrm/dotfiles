local M = {}

-- 覆盖配置
local override = require "custom.override"

M.plugins = {

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["goolord/alpha-nvim"] = override.alpha,
    ["williamboman/mason.nvim"] = override.mason,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
  },

  -- 用户插件
  user = require "custom.plugins",
}

M.ui = {
  -- 主题配置
  theme = "palenight",
}

-- 键位配置
M.mappings = require "custom.mappings"

return M
