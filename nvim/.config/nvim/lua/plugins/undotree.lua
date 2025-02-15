-- Visualize undo history in tree form and quickly switch back to
-- older versions of your code.
--
-- https://github.com/mbbill/undotree

return {
  "mbbill/undotree",

  config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[U]ndo tree toggle' })
  end
}
