local plugins = {
  -- This should be set here in CUSTOM instead of in the .config/nvim/lua/plugins/configs/nvimtree.lua
  -- but I am lazy. Will get around to it sometime
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   options = {
  --     view = {
  --       number = true,
  --       relativenumber = true
  --     },
  --   },
  -- },
  -- vimgrep arguments do NOT apply to the find_files built-in module

  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    opts = function()
      return require "custom.configs.nvim-treesitter-context"
    end,
  },

  {
    'luckasRanarison/tree-sitter-hypr',
    lazy = false
  },

  {
    -- cool cursor effect when switching windows/doing long jumps
    'danilamihailov/beacon.nvim',
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    -- this closes the DAP ui once it's done executing. commented out   
    --   dap.listeners.before.event_terminated["dapui_config"] = function()
    --     dapui.close()
    --   end
    --   dap.listeners.before.event_exited["dapui_config"] = function()
    --     dapui.close()
    --   end
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python", "go" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
