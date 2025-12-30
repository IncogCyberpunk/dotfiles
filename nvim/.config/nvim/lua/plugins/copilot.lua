return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<C-y>', -- key to accept ghost text
          next = '<C-n>',
          prev = '<C-p>',
          dismiss = '<C-e>',
        },
      },
      panel = { enabled = false },
    }
  end,
  keys = {
    {
      '<leader>ce',
      function()
        local ok, err = pcall(vim.cmd, 'Copilot enable')
        if ok then
          vim.notify('Copilot enabled', vim.log.levels.INFO)
        else
          vim.notify('Failed to enable Copilot: ' .. err, vim.log.levels.ERROR)
        end
      end,
      desc = 'Enable Copilot',
    },
    {
      '<leader>cd',
      function()
        local ok, err = pcall(vim.cmd, 'Copilot disable')
        if ok then
          vim.notify('Copilot disabled', vim.log.levels.INFO)
        else
          vim.notify('Failed to disable Copilot: ' .. err, vim.log.levels.ERROR)
        end
      end,
      desc = 'Disable Copilot',
    },
  },
}
