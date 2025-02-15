-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open [P]roject [V]iew (netrw)" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Run lsp [f]ormat on buffer' })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr",
  function()
    require('cellular-automaton').start_animation('make_it_rain')
  end,
  { desc = "[M]ake [I]t [R]ain" })
vim.keymap.set("n", "<leader>gl",
  function()
    require('cellular-automaton').start_animation('game_of_life')
  end,
  { desc = "[G]ame [O]f [L]ife" })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
