local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier,
  b.formatting.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,

  -- golang
  b.formatting.gofmt,
  b.formatting.goimports,
  b.formatting.goimports_reviser,
  b.formatting.golines,
  b.diagnostics.golangci_lint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
