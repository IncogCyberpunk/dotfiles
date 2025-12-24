return {
  -- Autoclose parentheses, brackets, quotes, etc.
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    -- First initialize autopairs
    npairs.setup {
      disable_in_macro = false,
    }
  end,
}
