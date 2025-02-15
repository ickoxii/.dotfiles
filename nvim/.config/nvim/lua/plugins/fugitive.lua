-- Git integration
--
-- https://github.com/tpope/vim-fugitive

return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive: [G]it [S]tart" })

    local ickoxii_fugitive = vim.api.nvim_create_augroup("ickoxii_fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd({ "BufWinEnter", "BufEnter" }, {
      pattern = { "*" },
      group = ickoxii_fugitive,
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        print("now we're cooking with gas")

        local bufnr = vim.api.nvim_get_current_buf()

        vim.keymap.set("n", "<leader>p", function()
          vim.cmd.Git({ "pull" })
        end, { buffer = bufnr, remap = false, desc = "Fugitive: `git pull`" })

        vim.keymap.set(
          "n",
          "<leader>P",
          "<cmd>Git push -u origin ",
          { buffer = bufnr, remap = false, desc = "Fugitive: `git push -u origin <branch>`" }
        )

        vim.keymap.set(
          "n",
          "<leader>gb",
          "<cmd>Git branch<cr>",
          { buffer = bufnr, remap = false, desc = "Fugitive: `git branch`" }
        )

        vim.keymap.set(
          "n",
          "<leader>gr",
          "<cmd>Git remote -v<cr>",
          { buffer = bufnr, remap = false, desc = "Fugitive: `git remove -v`" }
        )
      end,
    })

    vim.keymap.set("n", "g2", "<cmd>diffget //2<cr>", { desc = "Fugitive: <cmd>diffget //2<cr>" })
    vim.keymap.set("n", "g3", "<cmd>diffget //3<cr>", { desc = "Fugitive: <cmd>diffget //3<cr>" })
  end,
}
