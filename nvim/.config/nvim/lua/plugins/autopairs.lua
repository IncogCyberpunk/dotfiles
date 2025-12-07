return{
  -- Autoclose parentheses, brackets, quotes, etc.
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    -- First initialize autopairs
    npairs.setup({
      disable_in_macro = false,
    })

    -- Then add your custom rule
    npairs.add_rules({
      Rule("if(", ")")
        :use_key("(")                               -- tells autopairs to trigger on "("
        :replace_endpair(function() return "  )" end) -- inserts "(  )"
        :set_end_pair_length(2),                    -- place cursor 1 space before the end
    })
  end,
}
