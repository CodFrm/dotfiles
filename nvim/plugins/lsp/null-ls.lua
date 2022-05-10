local null_ls = require "null-ls"
local b = null_ls.builtins

-- 参考 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
--
local sources = {
  -- Web
  b.formatting.prettierd,
  b.formatting.eslint_d,
  b.code_actions.eslint_d,

  -- Lua
  b.formatting.stylua,
  -- b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Go
  b.formatting.gofmt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    -- on_attach = function(client)
      -- if client.resolved_capabilities.document_formatting then
      --   vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      -- end
    -- end,
  }
end

return M
