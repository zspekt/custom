local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize imports",
    },
  },
}

lspconfig.biome.setup {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "shell", "bash", "zsh", "sh" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "gopls" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sql", "pgsql", "mysql" },
  root_dir = function(_)
    return vim.loop.cwd()
  end,
}

-- lspconfig.sqlls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- messes up formatting
--
-- lspconfig.sqls.setup {
--   on_attach = function(client, bufnr)
--     require("sqls").on_attach(client, bufnr) -- require sqls.nvim
--   end,
--   settings = {
--     sqls = {
--       connections = {
--         {
--           driver = "postgresql",
--           dataSourceName = "host=localhost port=5432 user=postgres password=admin dbname=test",
--         },
--       },
--     },
--   },
-- }
