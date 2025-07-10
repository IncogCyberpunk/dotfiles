return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },   -- if you use the mini.nvim suite
  opts = {},
  config = function()
    require('render-markdown').setup({
      completions = { lsp = { enabled = true } },
      vim.keymap.set("n","<leader>mt","<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Render Markdown" }),
    })
  end,
}
