return {
  'saghen/blink.cmp',
  enabled = true,
  dependencies = {
    {
      'folke/lazydev.nvim', -- NOTE: This sets up lua-ls to be avaiable while editing nvim lua config files
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-j>'] = { 'snippet_backward', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true } },
    signature = { enabled = true },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- priority
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
