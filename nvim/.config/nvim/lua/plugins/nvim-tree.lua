return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  enabled = true,
  main = "nvim-tree",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {

    -- NOTE: Keybindings inside the keys section are global keybindings and are a method to specify custom keybindings , a functionality provided solely by Lazy.nvim
    { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function()
    require('nvim-tree').setup {
      -- NOTE: This function runs when a buffer (like NvimTree) is attached to a window.
      on_attach = function(bufnumber)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "NvimTree: " .. desc, buffer = bufnumber, silent = true, noremap = true }
        end

        -- NOTE: Keeping all the default keybindings
        api.config.mappings.default_on_attach(bufnumber)

        -- Custom keybindings using the nvim-tree-api are  added here
        -- NOTE: These are keybindigs for buffer so we use vim.keymap.set
        vim.keymap.set("n", "<C-e>", api.tree.close, opts("Map the default <C-e> keybinding to close the tree"))

        vim.keymap.set("n", "l", api.node.open.edit, opts("Navigate Inside "))

        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Parent"))

        vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))

        vim.keymap.set("n", "<M-h>", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
      end,

      filters = {
        dotfiles = true,
      },

    }

    -- NOTE: Make :q and :bd work as if tree was not visible
    vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
      nested = false,
      callback = function(e)
        local tree = require('nvim-tree.api').tree

        if not tree.is_visible() then
          return
        end

        local winCount = 0
        for _, winId in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(winId).focusable then
            winCount = winCount + 1
          end
        end

        if e.event == 'QuitPre' and winCount == 2 then
          vim.api.nvim_cmd({ cmd = 'qall' }, {})
        end

        if e.event == 'BufEnter' and winCount == 1 then
          vim.defer_fn(function()
            tree.toggle({ find_file = true, focus = true })
            tree.toggle({ find_file = true, focus = false })
          end, 10)
        end
      end
    })

  end
}
