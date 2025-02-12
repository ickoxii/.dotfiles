return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },

  --[[
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  ]]--

  -- "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  "gpanders/editorconfig.nvim",
  "nvim-java/nvim-java",
  "iamcco/markdown-preview.nvim",
}
