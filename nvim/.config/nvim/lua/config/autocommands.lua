-- Auto-format on save
local save_group = vim.api.nvim_create_augroup('SaveGroup', { clear = true })
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    local bt = vim.bo.buftype

    local ignore_filetypes = { 'oil', 'markdown', 'text', 'NvimTree', 'hyprlang' }

    -- if the filetype is in the ignore list, return
    for _, file in ipairs(ignore_filetypes) do
      if bt == 'acwrite' then
        return
      end

      if ft == file then
        return
      end
    end

    -- Check if any LSP client other than 'copilot' is attached
    local clients = vim.lsp.get_clients()
    local has_lsp = false

    for _, client in pairs(clients) do
      if client.name ~= 'copilot' then
        has_lsp = true
        break
      end
    end

    if not has_lsp then
      return
    end

    vim.lsp.buf.format { async = false }
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
