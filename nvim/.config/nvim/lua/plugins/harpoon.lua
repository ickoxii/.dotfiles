-- Harpoon
-- https://github.com/ThePrimeagen/harpoon

return {
  {
    "ThePrimeagen/harpoon",
    -- lazy = true,
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-h>", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<C-j>", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<C-k>", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<C-l>", function()
        ui.nav_file(4)
      end)
    end,
  },
}

-- Harpoon
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
--
-- `Error while dumping encode_tv2json() argument`:
-- https://github.com/ThePrimeagen/harpoon/issues/390
--
-- General issues with harpoon managing sessions

-- return {
--   {
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       local harpoon = require("harpoon")
--
--       harpoon:setup()
--
--       vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end,
--         { desc = 'Harpoon: Prepend to Harpoon' })
--       vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
--         { desc = 'Harpoon: Append to Harpoon' })
--       vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
--         { desc = 'Harpoon: Open quick menu' })
--
--       vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
--         { desc = 'Harpoon: Switch to poon 1' })
--       vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
--         { desc = 'Harpoon: Switch to poon 2' })
--       vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
--         { desc = 'Harpoon: Switch to poon 3' })
--       vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
--         { desc = 'Harpoon: Switch to poon 4' })
--     end,
--   },
-- }
