-- Just an example, supposed to be placed in /lua/custom/

local userPlugins=require("custom.plugins")

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   -- theme = "onedark",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lsp.lspconfig",
      },
   },

  user = userPlugins
}

return M
