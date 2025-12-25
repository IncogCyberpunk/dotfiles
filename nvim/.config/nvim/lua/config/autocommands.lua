-- Auto-format on save
local save_group = vim.api.nvim_create_augroup('SaveGroup', { clear = true })
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    local bt = vim.bo.buftype

    if ft ~= 'oil' and ft ~= 'NvimTree' and bt ~= 'acwrite' then
      vim.lsp.buf.format { async = false }
    end
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
