-- NOTE: use conform.nvim & nvim-lint for formatters and linters that don't have an LSP server
vim.lsp.enable { 'lua_ls', 'ts_ls', 'tailwindcss', 'pyright', 'clangd', 'eslint', 'stylua' }

-- NOTE: Enable built-in LSP-based completion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
