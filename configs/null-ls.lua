local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    -- go
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,

    -- js/ts
    null_ls.builtins.formatting.biome,
    -- null_ls.builtins.formatting.biome.with {
    --   args = {
    --     "check",
    --     "--apply-unsafe",
    --     "--formatter-enabled=true",
    --     "--organize-imports-enabled=true",
    --     "--skip-errors",
    --     "$FILENAME",
    --   },
    -- },
    -- null_ls.builtins.diagnostics.eslint,

    -- lua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.luacheck,

    -- null_ls.builtins.formatting.prettier,

    -- shell
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
