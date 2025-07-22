return {
  -- Debugger configuration for Neovim
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui", -- UI for DAP
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
    "theHamsta/nvim-dap-virtual-text",   -- Virtual text for DAP
    "nvim-telescope/telescope-dap.nvim", -- Telescope integration for DAP
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    require('dapui').setup();

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/incog/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            description = 'Enable pretty-printing for gdb',
            text = '-enable-pretty-printing',
            ignoreFailures = false
          },
        },
      },
    }

    -- For C files:
    dap.configurations.c = dap.configurations.cpp

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set('n', '<leader>dt', ":DapToggleBreakpoint<CR>",
      { noremap = true, silent = true, desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '<leader>dc', ":DapContinue<CR>", { noremap = true, silent = true, desc = "Continue" })
  end
}
