local M = {}

M.general = {
  n = {
  ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left" },
  ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right" },
  ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window down" },
  ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window up" },

  ["<leader>tw"] = {"<cmd> set wrap <CR>", "Line wrapping on"},
  ["<leader>tn"] = {"<cmd> set nowrap <CR>", "Line wrapping off"}
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"},
    ["<leader>dcb"] = {"<cmd> DapContinue <CR>"};
    ["<leader>dtb"] = {"<cmd> DapTerminate <CR>"};
    ["<leader>duc"] = {
      function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.close();
      end,
      "Close dapui"
    },
    ["<leader>duo"] = {
      function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.open();
      end,
      "Open dapui"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
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
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Run Python test"
    }
  }
}

return M
