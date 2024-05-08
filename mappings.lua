local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    ["<leader>tw"] = { "<cmd> set wrap <CR>", "Line wrapping on" },
    ["<leader>tn"] = { "<cmd> set nowrap <CR>", "Line wrapping off" },
    ["<leader>sfc"] = { "<cmd> set filetype=yaml.docker-compose <CR>", "Set filetype to docker-compose" },
  },
}

M.noice = {
  n = {
    ["<leader>rd"] = { "<cmd>NoiceDismiss<CR>", "Dismiss Noice popups" },
  },
}

M.oil = {
  n = {
    ["-"] = { "<CMD>Oil<CR>", "Open parent directory" },
    ["<leader>gd"] = {
      function()
        local oil = require "oil"
        local config = require "oil.config"
        if #config.columns == 1 then
          oil.set_columns { "icon", "permissions", "size", "mtime" }
        else
          oil.set_columns { "icon" }
        end
      end,
      "Toggle detailed view",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<F6>"] = { "<cmd> DapStepOut <CR>" },
    ["<F7>"] = { "<cmd> DapStepInto <CR>" },
    ["<F8>"] = { "<cmd> DapStepOver <CR>" },

    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dr"] = { "<cmd> DapContinue <CR>" },
    ["<leader>dt"] = { "<cmd> DapTerminate <CR>" },
    ["<leader>duc"] = {
      function()
        require("dapui").close()
      end,
      "Close dapui",
    },
    ["<leader>duo"] = {
      function()
        require("dapui").open()
      end,
      "Open dapui",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files hidden=true <CR>", "Find files" },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
    ["<leader>gai"] = {
      "<cmd> GoIfErr <CR>",
      "Add if != err statement",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "Run Python test",
    },
  },
}

return M
