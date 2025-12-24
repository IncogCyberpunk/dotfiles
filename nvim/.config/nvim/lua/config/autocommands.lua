local save_group = vim.api.nvim_create_augroup('SaveGroup', { clear = true })

-- Auto-format on save
vim.api.nvim_create_autocmd('BufWriteCmd', {
  callback = function()
    vim.lsp.buf.format()
    vim.cmd 'w'
  end,
  group = save_group,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
