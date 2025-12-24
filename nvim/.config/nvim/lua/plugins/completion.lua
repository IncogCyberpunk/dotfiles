return {
  'saghen/blink.cmp',
  enabled = true,
  dependencies = {
    {
      "folke/lazydev.nvim",-- NOTE: This sets up lua-ls to be avaiable while editing nvim lua config files
      ft="lua",
      opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
  },
  'rafamadriz/friendly-snippets' 
},

  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = { documentation = { auto_show = true } },
    signature = {enabled = true},
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lazydev','lsp', 'path', 'snippets', },
      providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
    },

    fuzzy = {implementation = "prefer_rust_with_warning"}
  },
  opts_extend = { 'sources.default' },
}
