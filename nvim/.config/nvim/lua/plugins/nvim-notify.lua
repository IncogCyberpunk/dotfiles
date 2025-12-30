return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup()

    vim.notify = require 'notify' -- To set nvim-notify as the default notify function so that all notify functions use nvim-notify
  end,
}
