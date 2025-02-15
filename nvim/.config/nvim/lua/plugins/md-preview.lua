-- Live preview markdown files in a browser window
-- https://github.com/iamcco/markdown-preview.nvim

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.keymap.set('n', '<leader>md', '<cmd>MarkdownPreviewToggle<cr>',
      { desc = '[M]arkdown [P]review Toggle' })
  end,
  ft = { "markdown" },
}
