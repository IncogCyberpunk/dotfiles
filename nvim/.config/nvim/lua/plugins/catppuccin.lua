return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay1, bold = true },
          CursorLineNr = { fg = colors.mauve, bold = true },
        }
      end,
      auto_integrations = true,
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
