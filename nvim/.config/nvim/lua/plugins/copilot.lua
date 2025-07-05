return {
  'github/copilot.vim',
  keys = {
    {
      '<leader>ce',
      function()
        vim.cmd('Copilot enable')
        vim.notify('Copilot enabled', vim.log.levels.INFO)
      end,
      desc = 'Enable Copilot',
    },
    {
      '<leader>cd',
      function()
        vim.cmd("Copilot disable")
        vim.notify('Copilot disabled',vim.log.levels.INFO)
      end,
      desc = 'Disable Copilot',
    },
  },
}
