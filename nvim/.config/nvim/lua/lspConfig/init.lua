-- NOTE: use conform.nvim & nvim-lint for formatters and linters that don't have an LSP server
vim.lsp.enable { 'lua_ls', 'hyprls', 'ts_ls', 'tailwindcss', 'pyright', 'clangd', 'eslint', 'stylua', 'bashls' }

vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
