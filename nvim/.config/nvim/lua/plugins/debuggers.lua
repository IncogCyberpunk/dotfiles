return {
  -- NOTE: For help , lookup `:h dap.txt`
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui', -- UI for DAP
    'nvim-neotest/nvim-nio', -- A library for asynchronous IO in Neovim, inspired by the asyncio library in Python.
    'theHamsta/nvim-dap-virtual-text', -- Displays debug info (like variable values) inline in your code as virtual text
    'nvim-telescope/telescope-dap.nvim', -- Telescope integration for DAP, so you can browse breakpoints, stacks, etc.
    'microsoft/vscode-js-debug', -- Debugger for JavaScript
  },

  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    local opts = { noremap = true, silent = true }

    require('dapui').setup()
    require('nvim-dap-virtual-text').setup()

    -- NOTE: Configuring dap-ui to open and close automatically , when a debugging session is initiated or terminated respectively by user inside nvim
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

    local js_debug_path = vim.fn.stdpath 'data' .. '/nvim/lazy/vscode-js-debug/src/dapDebugServer.js'

    -- For JS files:
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = '::1',
      port = '${port}',
      executable = {
        command = '/usr/bin/js-debug-dap',
        -- 💀 Make sure to update this path to point to your installation
        args = {'${port}'},
      },
    }

    dap.configurations.javascript = {
      {
        type = 'pwa-node', -- which debug adapter to use
        request = 'launch', -- indicates whether debug adapter should launch a debugee or attach to one that's already running
        name = 'Launch file', -- user-friendly name of the configuration
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
    }

    dap.configurations.typescript= dap.configurations.javascript

    -- NOTE: Configuring how nvim communicates with the debug adapter `cppdbg`;
    dap.adapters['cppdbg'] = {
      type = 'executable',
      command = '/home/incog/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }

    -- NOTE: Configurations for the debugee (cpp in this case)
    dap.configurations.cpp = {
      {
        type = 'cppdbg',
        request = 'launch',
        name = 'Launch file',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {
            description = 'Enable pretty-printing for gdb',
            text = '-enable-pretty-printing',
            ignoreFailures = false,
          },
        },
      },
    }

    -- NOTE: Using same configurations for C debugee as C++;
    dap.configurations.c = dap.configurations.cpp

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, opts, { desc = 'Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dc', dap.continue, opts, { desc = 'Continue' })
  end,
}
