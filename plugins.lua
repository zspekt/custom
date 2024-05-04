local plugins = {

  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        default_file_explorer = true,
      }
    end,
  },

  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup {}
  --   end,
  -- },

  -- codeium nvim uses cmp. i find the vim version to be more comf
  --

  {
    "p00f/nvim-ts-rainbow",
  },

  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  --
  --   config = function()
  --     vim.g.codeium_no_map_tab = 1
  --
  --     vim.keymap.set("i", "<C-y>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html" },
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", desc = "Go to previous harpoon mark" },
      { "<leader>fi", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show harpoon marks" },
    },
  },

  {
    "rasulomaroff/reactive.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.reactive"
    end,
  },

  {
    "AckslD/muren.nvim",
    config = true,
    create_commands = false,
    keys = {
      { "<leader>rp", "<cmd>lua require('muren.api').toggle_ui()<CR>", desc = "Toggle Muren UI" },
    },
  },

  {
    "olimorris/persisted.nvim",
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = function()
      return require "custom.configs.nvim-treesitter-context"
    end,
  },

  {
    "luckasRanarison/tree-sitter-hypr",
    lazy = false,
  },

  {
    -- cool cursor effect when switching windows/doing long jumps
    "danilamihailov/beacon.nvim",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- nvim-dap-ui requires nvim-nio to be installed. Install from https://github.com/nvim-neotest/nvim-nio
  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
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
    end,
  },
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    event = "VeryLazy",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    -- ft = { "python", "go" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- go
        "gopls",

        -- python
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",

        -- lua
        "stylua",
        "luacheck",

        -- js/ts
        "biome",
        "typescript-language-server",

        "js-debug-adapter",

        -- shell
        "shfmt",
        "shellcheck",

        -- sql

        -- sqls messes up formatting
        -- "sqls",
        "sqlls",
        "sqlfluff",

        -- css
        "css-lsp",
        "stylelint",

        -- html
        -- "angular-language-server",

        -- c
        -- "clangd", apparently ccls is better. ccls isnt available on mason registry though
        "clang-format",

        --misc
        "prettier",
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
