-- overriding default plugin configs!
local M = {}

M.treesitter = {
    ensure_installed = {"vim", "html", "css", "javascript", "json", "toml", "markdown", "markdown_inline", "c", "bash",
                        "lua", "go"}
}

M.nvimtree = {
    filters = {
        dotfiles = false,
        custom = {".git", ".DS_Store", ".idea"}
    },

    git = {
        enable = true,
        ignore = false
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true
            }
        }
    }
}

M.mason = {
    ensure_installed = { -- lua stuff
    "lua-language-server", "stylua", -- web dev
    "css-lsp", "html-lsp", "typescript-language-server", "deno", "emmet-ls", "json-lsp", "eslint-lsp", "eslint_d",

    -- go
    "gopls", "goimports", "golangci-lint", "go-debug-adapter", -- "golines",
    -- markdown
    "markdownlint", -- shell
    "shfmt", "shellcheck"}
}

M.cmp = {
    sources = { -- trigger_characters is for unocss lsp
    {
        name = "nvim_lsp",
        trigger_characters = {"-"}
    }, {
        name = "path"
    }, {
        name = "luasnip"
    }, {
        name = "buffer"
    }, {
        name = "codeium"
    }, {
        name = "nvim_lua"
    }},
    experimental = {
        ghost_text = true
    }
}

return M
