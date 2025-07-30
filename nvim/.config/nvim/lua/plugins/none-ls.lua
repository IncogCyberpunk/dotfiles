return {
  'nvimtools/none-ls.nvim',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    require('mason-tool-installer').setup {
      ensure_installed = {
        'prettier', -- ts/js formatter
        'stylua', -- lua formatter
        'eslint_d', -- ts/js linter
        'shfmt', -- Shell formatter
        'checkmake', -- linter for Makefiles
        'ruff', -- Python linter and formatter
      },
      automatic_installation = true,
    }

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
  end,
}
