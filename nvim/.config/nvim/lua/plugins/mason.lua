return {
  'mason-org/mason.nvim',
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  },
  dependencies = {
    'neovim/nvim-lspconfig', -- NOTE: This provides quickstart LSP configs for all LSP servers in the runtimepath ,which can then directly used by using `vim.lsp.enable()`
  },
  config = function()
    require('mason').setup {}
    -- NOTE: We are trying to use `mason-registry` api along with the `package` API returned by the package object returned when using `mason-registry` for various things
    local registry = require 'mason-registry'

    local tools_to_install = {
      'lua-language-server',
      'typescript-language-server',
      'clangd',
      'pyright',
      'hyprls',
      'tailwindcss-language-server',
      'js-debug-adapter', -- JS/TS debugger
      'cpptools', -- C/C++/Rust debugger
      'cpplint', -- C/C++ linter
      'eslint_d', -- JS/TS linter
    }

    local function install_tool(package)
      package:install(nil, function(success)
        vim.schedule(function()
          if success then
            vim.notify('Successfully Installed ' .. package.name .. ' using Mason', vim.log.levels.INFO)
          else
            vim.notify('Failed to Install ' .. package.name .. ' using Mason', vim.log.levels.ERROR)
          end
        end)
      end)
    end

    local function check_if_installed(tool)
      if not registry.is_installed(tool) then
        local package = registry.get_package(tool)
        install_tool(package)
      end
    end

    -- NOTE: Check if the tools are installed, if not install them
    for _, tool in ipairs(tools_to_install) do
      check_if_installed(tool)
    end
  end,
}
