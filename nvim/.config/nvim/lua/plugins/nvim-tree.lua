return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  enabled = true,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts={
    -- NOTE: This function runs when a buffer (like NvimTree) is attached to a window.
    on_attach = function(bufnumber)
      local api= require("nvim-tree.api")

      local function opts(desc)
        return { desc = "NvimTree: " .. desc, buffer = bufnumber, silent = true, noremap = true }
      end

      -- NOTE: Keeping all the default keybindings
      api.config.mappings.default_on_attach(bufnumber)

      -- Custom keybindings using the nvim-tree-api are  added here
      -- NOTE: These are keybindigs for buffer so we use vim.keymap.set 
      -- NOTE: These keybindings inside opts section  only work when the plugins' buffer is active(focused)
      vim.keymap.set("n", "<C-e>", api.tree.close , opts("Map the default <C-e> keybinding to close the tree") )
      vim.keymap.set("n", "l", api.node.open.edit,opts("Navigate Inside ") )
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Parent") )

    end,

    filters={
      dotfiles = true,
    }
  },
  keys = {
    -- NOTE: Keybindings inside the keys section are global keybindings and are a method to specify custom keybindings , a functionality by Lazy.nvim
    { "<C-e>", "<cmd>NvimTreeOpen<cr>", desc = "Toggle NvimTree" },
  }
}
